list = [1,2,3,4,5]


def lis_Sum():
    lsum = 0
    for i in list:
        lsum=lsum+i
    return lsum


Sum_List = print(lis_Sum())

########  Remove duplicates from List      ##############

list2 = [1,2,3,4,5,3,4,2]

def lis_duplicates(list2):
    final_list= []
    for i in list2:
        if i not in final_list:
            final_list.append(i)
    print(final_list)

lis_duplicates(list2)

