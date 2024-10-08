import mysql.connector

def fetch_data_from_mysql():
    """
    The function fetches data from the MySQL database with the user's input.
    Inputs being Hust, Username, Password, Database, and Table name.
    When the input is fetched from user, the function returns a list of data.
    
    Returns:
    CSV data: List of data from the MySQL database.
    """
    try:
        # Get user input for MySQL connection details
        host = input("Enter MySQL host (default is 'localhost'): ") or "localhost"
        username = input("Enter MySQL username: ")
        password = input("Enter MySQL password: ")
        database = input("Enter MySQL database: ")
        table = input("Enter table name: ")
        column = input("Enter column name: ")

        # Establish a connection to the MySQL database
        connection = mysql.connector.connect(
            host=host,
            user=username,
            password=password,
            database=database,
            auth_plugin='mysql_native_password'
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Construct the SQL query to fetch data
            query = f"SELECT {column} FROM {table};"

            # Execute the query
            cursor.execute(query)

            # Fetch all the rows as a list of data
            results = cursor.fetchall()

            return results

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

print(fetch_data_from_mysql.__doc__)
print(fetch_data_from_mysql())