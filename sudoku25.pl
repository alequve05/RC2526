:- use_module(library(clpfd)).

/*
	Sudoku 25x25 (Bloques de 5x5)
	
	sudoku25(+Matriz).
*/
sudoku25(Rows) :- 
    % 1. Validar que sea una matriz de 25x25
    length(Rows, 25),
    maplist(same_length(Rows), Rows),
    
    % 2. El dominio ahora es del 1 al 25
    append(Rows, Vs),
    Vs ins 1..25,
    
    % 3. Restricción de filas: todos los elementos deben ser distintos
    maplist(all_distinct, Rows),
    
    % 4. Restricción de columnas usando la transpuesta
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    
    % 5. Restricción de bloques de 5x5
    % Agrupamos las filas de 5 en 5 para procesar los bloques
    Rows = [R1,R2,R3,R4,R5,
            R6,R7,R8,R9,R10,
            R11,R12,R13,R14,R15,
            R16,R17,R18,R19,R20,
            R21,R22,R23,R24,R25],
    blocks25(R1,R2,R3,R4,R5),
    blocks25(R6,R7,R8,R9,R10),
    blocks25(R11,R12,R13,R14,R15),
    blocks25(R16,R17,R18,R19,R20),
    blocks25(R21,R22,R23,R24,R25).

/*
blocks25(+L1, +L2, +L3, +L4, +L5).
	Es cierto si los cinco bloques de 5x5 que forman las 
	cinco listas de longitud 25 tienen valores distintos.
*/
blocks25([], [], [], [], []).
blocks25([A1,A2,A3,A4,A5|Resto1], 
         [B1,B2,B3,B4,B5|Resto2], 
         [C1,C2,C3,C4,C5|Resto3], 
         [D1,D2,D3,D4,D5|Resto4], 
         [E1,E2,E3,E4,E5|Resto5]) :- 
    % Obligamos a que los 25 elementos de este bloque de 5x5 sean distintos
    all_distinct([A1,A2,A3,A4,A5,
                  B1,B2,B3,B4,B5,
                  C1,C2,C3,C4,C5,
                  D1,D2,D3,D4,D5,
                  E1,E2,E3,E4,E5]),
    % Llamada recursiva para los siguientes bloques de las mismas 5 filas
    blocks25(Resto1, Resto2, Resto3, Resto4, Resto5).
