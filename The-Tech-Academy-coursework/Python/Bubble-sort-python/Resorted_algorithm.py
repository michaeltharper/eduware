'''
DRILL: Write your own version of the sorted() method in Python. 
This method should take a list as an argument and return a list that is sorted in ascending order. 
Call your method passing in the following lists as arguments and print out each sorted list to the shell. 

This should should be an algorithm that you write.
Do not use .sort() or the sorted() methods in your method.

[67, 45, 2, 13, 1, 998]
[89, 23, 33, 45, 10, 12, 45, 45, 45]

Your sorted lists should look like this when displayed:
[1, 2, 13, 45, 67, 998]
[10, 12, 23, 33, 45, 45, 45, 45, 89]

>>>
http://interactivepython.org/runestone/static/pythonds/SortSearch/sorting.html
http://interactivepython.org/runestone/static/pythonds/SortSearch/TheBubbleSort.html

In Python, it is possible to perform simultaneous assignment.
The syntax a,b=b,a results in two assignment statements being expressed as one statement.
'''

#for clean exit
import os


## BUBBLE SORT w simultaneous assignment
def bubbleSort(alist):
    for passnum in range(len(alist)-1,0,-1):
        for i in range(passnum):
            if alist[i]>alist[i+1]:
            
               # TOGGLE TEMP VS SIMULTANEOUS
                temp = alist[i]
                alist[i] = alist[i+1]
                alist[i+1] = temp
                
                #use simultaneous assignment a,b=b,a
                #alist[i],alist[i+1]=alist[i+1],alist[i]

alist = [67, 45, 2, 13, 1, 998]
blist = [89, 23, 33, 45, 10, 12, 45, 45, 45]
print('\nbubblesorts using a temp variable: ')
bubbleSort(alist)
print(alist)
bubbleSort(blist)
print(blist)

## SHORT BUBBLE SORT w simultaneous assignment
def shortBubbleSort(alist):
    exchanges = True
    passnum = len(alist)-1
    while passnum > 0 and exchanges:
       exchanges = False
       for i in range(passnum):
           
           if alist[i]>alist[i+1]:
               exchanges = True
               #TOGGLE TEMP VS SIMULTANEOUS
               #temp = alist[i]
               #alist[i] = alist[i+1]
               #alist[i+1] = temp
               
               #use simultaneous assignment a,b=b,a
               alist[i],alist[i+1]=alist[i+1],alist[i]

       passnum = passnum-1

alist = [67, 45, 2, 13, 1, 998]
blist = [89, 23, 33, 45, 10, 12, 45, 45, 45]
print('\nshortbubblesorts using simultaneous assignment: ')
shortBubbleSort(alist)
print(alist)
shortBubbleSort(blist)
print(blist)

os._exit(1)
