def get_item_category(item_name):
    if "Prime" in item_name:
        return "prime part"
    elif "Primed" in item_name:
        return "mod"
    elif "Relic" in item_name:
        return "relic"
    else:
        return "uncategorized"

items = ["Titaneye Relic", "Focused Grit Primed Part", "Synthesis Prism"]

for item in items:
    category = get_item_category(item)
    print(f"{item} is a {category}")