#Practica de matrices

#Ejercicio 1

def multiplica_vectores_cola(v1,v2):
    if len(v1) != len(v2):
        return "Error: las longitudes por multiplicar deben ser las mismas"
    else:
        return m_v_colAux(v1,v2,0)
    
def m_v_colAux(v1,v2,res):
    if v1 == []:
        return res
    else:
        res += v1[0]*v2[0]
        return m_v_colAux(v1[1:],v2[1:],res)

#Ejercicio 2
def multiplica_kv(n, vector):
    if vector == []:
        return []
    else:
        return [n*vector[0]] + multiplica_kv(n, vector[1:])

#ejercicio 5
def diagonal(matriz):
    for lista in matriz:
        if len(matriz) != len(lista):
            return 'Error: matriz no es cuadrada'
    for j in range(len(matriz)):
        for i in range(len(matriz[j])):
            if i != j:
                if matriz[i][j] != 0:
                    return False
                else:
                    continue
            else:
                continue
    return True  

#Ejercicio 7
def matriz_nula(matriz):
    for lista in matriz:
        for elemento in lista:
            if elemento != 0:
                return False
    return True

#Ejercicio 10
#    e f     a  b  x  =  ea + fc  eb + fd  ex + fy    
#    g h  *  c  d  y     ga + hc  gb + hd  gx + hy

#   multiplicar_matrices([[1,1],[2,2]],[[3,4,5],[6,7,8]])

def multiplicar_matrices(matriz1, matriz2):
    res = []
    matriz2T = transpuesta(matriz2)
    for lista in matriz1:
        fila = []
        for lista2 in matriz2T:
            fila += [multiplica_vectores_while(lista,lista2)]
        res += [fila]
    return res

def multiplica_vectores_while(v1,v2):
    if len(v1) != len(v2):
        return "Error: las longitudes por multiplicar deben ser las mismas"
    else:
        res = 0
        while v1 != []:
            res += v1[0]*v2[0]
            (v1, v2)=(v1[1:],v2[1:])
        return res

def transpuesta(matriz):
    M = []
    for i in range(len(matriz[0])):
        fila = []
        for j in range(len(matriz)):
            fila += [matriz[j][i]]
        M += [fila]
        matriz[1:]
    return M

#filas y columnas

def matriz_identidad(n, m):
    matriz_I = []
    for i in range(n):
        fila = []
        for j in range(m):
            if i == j:
                fila += [1]
            else:
                fila += [0]
        matriz_I.append(fila)
    return matriz_I

def printMatriz(mat):
    for row in mat:
        print(row)
    return 

matriz = [[1, 1, 0], [2, 3, 0], [3, 4, 1]]
def gaussYordan(matriz):
    matriz_I = matriz_identidad(3, 3) #mismo n y m de matriz

    for i in range(3):#n
        fila = []
        for j in range(3):#m
            
            num_Neutro_Multiplicazion = 1/(matriz[i][j]) 
            multiplica_kv(n, vector)
    
    
    return




