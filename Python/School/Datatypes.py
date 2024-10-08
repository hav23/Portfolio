print(2+9) # Addition
print(3**2) # Powers
print(10-75) # Subtraction
fornavn = "Mette" # String representation
efternavn = "Sørensen"
print(fornavn, efternavn) # Connection of strings
age = 34 # Integer representation
print(fornavn,age, sep=", ") # Combined string and number representation
min_vaegt = 68
Boolean = True

print("katte"+"hunde"+"mus") # Concatonation of strings
print("katte","hunde", "mus") # Listing of strings
print("Hello", end=" ") # addition of end tag: "Hello ". Without line break
print("world") # Combines into the last line, then ends with a line break
print("katte", "hunde", "mus", sep=", ") # adds a comma between strings
print("Tekst"*5) # Takes the text and multiplies it, making it "tekstteksttekstteksttekst"
v_ex=5
print(v_ex==5) # Boolean operation, returns true.
num=42
print("The number is: " + str(num)) # Combines string and number and treats it all as string characters.
pi=3.14159
print("The number is: " + str(pi)) # Same, but with floats
num_str="123"
num_int=int(num_str) # Conversion to Integer
print("The number is:",num_int) # Concatonation after conversion,
float_num=8.4
int_num=int(float_num) # Conversion from float to integer, loses the .4
print("The number is:",int_num) 
print(f"Hejsa {fornavn} {efternavn}. Ifølge dit sygesikringsbevis er du {pi} år gammel.\nDu vejer: \t{min_vaegt} kg") 
        # F-string, allowing for in-line formatting and addition of variables