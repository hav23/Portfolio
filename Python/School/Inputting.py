itemName = "[Merchandise Item]"
itemPriceNoTax = 7458
itemPriceTax = 7458 * 0.2
print(f"Item Name: {itemName}\nPrice:\t\t{itemPriceNoTax}\nTax:\t\t{round(itemPriceTax,1)}\nTotal:\t\t{itemPriceNoTax + itemPriceTax}")

name = input("Username: ")
print(f"Hello, {name}! Welcome to the Merchandise Store!")

# Define the correct password
correct_password = "123"

# Ask the user for input
user_password = input("Enter your password: ")

# Check if the user's input matches the correct password
if user_password == correct_password:
    print(f"Access granted! With {user_password}, You're in.")
else:
    print("Access denied. Incorrect password.")
