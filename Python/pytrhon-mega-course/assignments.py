n=int(input())
print("The number is:",n)


sentence = "the sky is blue today."
name = "sarah smith"

print(sentence.capitalize())
print(name.title())

countries = []

while True:
    country = input("Enter the country: ")
    countries.append(country)
    print(countries)

# country = "USA"
#
# match country:
#     case "USA" | "United States":
#         print("Hello")
#     case "Italy" :
#         print("Ciao")
#     case "Germany":
#         print("Hallo")

employees = ["john smith", "sarah bremen", "dora dawson"]
for i in employees:
    print(i.title())

for item in ["sandals", "glasses", "trousers"]:
    print(item.capitalize())

mood="sleep"
strength=9.16
rank=3
print(mood,"",strength,"",rank)

color_codes=[]

color_codes.append((1,2))
color_codes.append((3,4))
color_codes.append((5,6))
print(tuple(color_codes))