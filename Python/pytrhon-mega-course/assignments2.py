# measurements = [177.8, 175.8, 166.9, 182.5]
# measurements.sort()
# for i in measurements:
#     print(i)
#
# user_entries = ['10', '19.1', '20']
# l=[float(i) for i in user_entries]
# print(sum(l))
#
# file=open("essay.txt","r")
# s=file.read()
# c=len(s)
# print(f"The file contains {c} characters.")
#
# with open('story.txt','r') as file:
#     s=file.read()
#     file.close()
# with open('story_copy.txt','w') as file:
#     file.write(s)
#     file.close()

# length = float(input("Enter length: "))
# width = float(input("Enter width: "))
#
# perimeter = (length + width) * 2
# area = length * width
#
# print("Perimeter is", perimeter)
# print("Area is", area)
#
# if perimeter < 14 and area < 8:
#     print("OK")
# else:
#     print("NOT OK")

day_temperatures ={}
day_temperatures["morning"]=(27.1,28.2,27.3)
day_temperatures["noon"]=(30.3,35.2,33.2)
day_temperatures["evening"]=(27.1,26.2,26.3)
print(day_temperatures)
