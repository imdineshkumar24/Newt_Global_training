# from functions import sumoflist
# import functions
# l=[1,2,3,4,5]
# print(sumoflist(l))
#
# l2=[1,2,3,4,5,6,7]
# print(functions.sumoflist(l2))
from parse3 import parse


# def foo(x=10):
#     return x*2
# x=4
# print(foo(x))
from parse3 import parse
def calculate(l,w):
    return l*w

s=input()
l,w= parse(s)
result =calculate(l,w)
print(result)