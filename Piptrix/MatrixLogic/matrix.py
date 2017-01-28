# -*- coding: utf-8 -*-
"""
Created on Sun Nov 20 15:50:09 2016

@author: Dave Ho
"""

'''
[[1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]]
'''

def trim(matrix, row, col):
    result = []
    for rownum in range(0, len(matrix)):
        if rownum != row:
            tmp = []
            for colnum in range(0, len(matrix[row])):
                if colnum != col:
                    tmp.append(matrix[rownum][colnum])
            result.append(tmp)
    return result

def determinant(matrix):
    if len(matrix) == 2:
        return ((matrix[0][0]*matrix[1][1])-(matrix[0][1]*matrix[1][0]))
    result = 0
    for i in range(0, len(matrix[0])):
        result += (((-1)**i)*matrix[0][i]*determinant(trim(matrix, 0, i)))
    return result

def multiply(matrix1, matrix2):
    if not len(matrix1[0])==len(matrix2):
        raise Exception("Error: Invalid Matrix Dimensions.")
    else:
        result = []
        for i in range(0, len(matrix1)):
            result.append([])
            for j in range(0, len(matrix2[0])):
                result[i].append(0)
        for i in range(0, len(matrix1)):
            for j in range(0, len(matrix2[0])):
                for k in range(0, len(matrix2)):
                    result[i][j] += matrix1[i][k] * matrix2[k][j]
        return result
                    

def inverse(matrix):
    d = determinant(matrix)
    result = []
    for rownum in range(0, len(matrix)):
        result.append([])
        sign = (-1)**rownum
        for colnum in range(0, len(matrix[rownum])):
            result[rownum].append((sign * determinant(trim(matrix, rownum, colnum)))/(d*1.0))
            
            if sign == 1:
                sign = -1
            else:
                sign = 1
            
    result = map(list, zip(*result))
    return result


m = [[12,7,3],
     [4 ,5,6],
     [7 ,8,9]]
     
n = [[5,8,1,2],
     [6,7,3,0],
     [4,5,9,1]]

matrix = [[1, 2, 3, 4],
          [4, 2, 3, 1],
          [10, 12, 13, 5],
          [0.5, 6, 28, 5]]


matrix3 = [[0, 1, 2],
          [3, -1, 0],
          [1,-2, 1]]
          
matrix4 = [[1, 5, 4, 2],
           [-2, 3, 6, 4],
           [5, 1, 0, -1],
           [2, 3, -4, 0]]
           
matrix5 = [[1, 2, 3, 3, 5],
           [3, 2, 1, 2, 2],
           [1, 2, 3, 4, 5],
           [-1, 0, -8, 1, 2],
           [7, 2, 1, 3, 2]]