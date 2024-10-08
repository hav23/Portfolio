"""TornAPI:
    Function libaray for grabbing data from the Torn API.
    Currently still in development, this currently only supports the grabbing of user data.
"""

import requests
import json
import time
from progress.bar import ShadyBar
from typing import List

rateMode = False   
"""True if you want to slow down the process of grabbing users from the API. Making it so you wont have to worry about reaching the API rate limit."""

class UserData:
    """
    A class for retrieving and saving user data from the Torn API.
    """
    def __init__(self, API_key: str, user_ids: List[int]):
        """
        Initialize the UserData class with an API key and a list of user IDs.

        :param API_key: The API key for the Torn API.
        :param user_ids: A list of user IDs to retrieve data for.
        """
        self.key = API_key
        self.ids = user_ids
        self.ts = time.strftime("%y%m%d-%H%M")
        self.log_file = f'user_data_[{self.ts}].json'
        self.data_dict = {}

    def get_data(self):
        """
        Retrieve user data from the Torn API for the user IDs provided.

        :return: A dictionary of dictionaries containing user data, indexed by user ID.
        """
        expected_keys = [
            "rank", "level", "honor", "gender", "property", "signup", "awards", "friends",
            "enemies", "forum_posts", "karma", "age", "role", "player_id", "name",
            "property_id", "competition", "revivable", "life", "status", "job", "faction",
            "married", "states", "last_action"
        ]
        bar = ShadyBar("Fetching Users: ", max = len(self.ids), suffix = '%(percent)d%% [%(elapsed_td)s / %(eta_td)s]')
        for cid in self.ids:
            url = f'https://api.torn.com/user/{cid}/profile?selections=profile&key={self.key}'
            response = requests.get(url)
            if response.status_code ==  200:
                user_data = response.json()
                user_dict = {k: user_data[k] for k in expected_keys if k in user_data}
                self.data_dict[cid] = user_dict
            if rateMode == True:
                time.sleep(0.75)
            bar.next()
        bar.finish()
        return self.data_dict

    def save_data(self):
        """
        Save the user data to a json file.
        """
        if self.data_dict:
            with open(self.log_file, 'w') as file:
                json.dump(self.data_dict, file, indent=4)
        else:
            print('No data to save.')

    def print_data(self):
        """
        Print the user data in a readable format.
        """
        for i, data in enumerate(self.data_dict):
            if (data["status"]["state"] == "Hospital") & (data["revivable"] == 1) :
                print(f'[{data["player_id"]}]\tName:{data["name"]}\tStatus: {data["last_action"]["status"]}')
                print(f'')

    def clear(self):
        """Clears the stored user data. Useful for use on runtimes where
        you wont need the older data from the last runs.
        """
        self.data_dict.clear()

class FactionData:
    """
    A class for retrieving and saving faction data from the Torn API.
    """
    def __init__(self, API_key: str, ids: List[int]):
        """
        Initialize the FactionData class with an API key and a list of faction IDs.

        :param API_key: The API key for the Torn API.
        :param faction_ids: A list of faction IDs to retrieve data for.
        """
        self.key = API_key
        self.faction_ids = ids
        self.ts = time.strftime("%y%m%d-%H%M")
        self.log_file = f'faction_data_[{self.ts}].json'
        self.data_dict = {}

    def get_data(self):
        """
        Retrieve faction data from the Torn API for the given list of faction IDs.

        :return: A dictionary of dictionaries containing faction data, indexed by faction ID.
        """
        bar = ShadyBar("Fetching Factions: ", max = len(self.faction_ids), suffix = '%(percent)d%% [%(elapsed_td)s / %(eta_td)s]')
        for faction_id in self.faction_ids:
            url = f'https://api.torn.com/faction/{faction_id}?selections=basic&key={self.key}'
            response = requests.get(url)
            if response.status_code ==   200:
                faction_data = response.json()
                try:
                    # Validate the faction data by checking for specific fields
                    if not all(key in faction_data for key in ["ID", "name", "tag", "leader", "co-leader", "respect", "age", "capacity", "best_chain", "rank", "members"]):
                        raise ValueError("Missing required fields in faction data")
                    # Add more validation checks as needed
                    self.data_dict[faction_id] = faction_data
                except ValueError as e:
                    print(f'[{faction_id}].\tValidation error in faction data: {e}')
                    print(f'\t{faction_data}')
                except Exception as e:
                    print(f'[{faction_id}].\tParse error in faction data: {e}')
                    print(f'\t{faction_data}')
            else:
                print(f'[{faction_id}].\tError: {response.status_code}')
            if rateMode == True:
                time.sleep(0.75)
            bar.next()
        bar.finish()
        return self.data_dict

    def convert_member_ids(self):
        """
        Extract the member IDs from the nested dictionary under the 'members' key
        and return them as a list of strings.
        """
        member_ids = []
        for faction_data in self.data_dict.values():
            members = faction_data.get('members', {})
            # Collect the keys (which are the member IDs as strings) and add them to the list
            member_ids.extend(members.keys())
        return member_ids
    
    def save_data(self):
        """
        Save the faction data to a json file.
        """
        if self.data_dict:
            with open(self.log_file, 'w') as file:
                json.dump(self.data_dict, file, indent=4)
        else:
            print('No data to save.')

    def print_data(self):
        """
        Print the faction data in a readable format.
        """
        for factionid in self.faction_ids:
            print(f'Name: {self.data_dict[factionid]["name"]} [{factionid}], Members: {len(self.data_dict[factionid]["members"])}')
            print(f'LeaderID: {self.data_dict[factionid]["leader"]}, Co-leaderID: {self.data_dict[factionid]["co-leader"]}')
            print(f'Age: {self.data_dict[factionid]["age"]}, Respect: {self.data_dict[factionid]["respect"]}')

    def clear(self):
        """Clears the stored faction data. Useful for use on runtimes where
        you won't need the older data from the last runs.
        """
        self.data_dict.clear()
        

if __name__ == '__main__':
    # key = 'SecretKey'
    # ids = [2325963] #It's me!
    # faction_ids = [7197] #It's my faction!
    
    # data_obj = UserData(key, ids)
    # data_obj.get_data()
    # data_obj.print_data()
    print("This library requires an initialization as a module to work.")