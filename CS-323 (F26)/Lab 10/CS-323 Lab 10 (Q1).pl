% Exercise 01

bmi(Weight, Height, Result) :- 
	Result is Weight / (Height * Height).

start :-
    write('Enter weight in kg:'), nl,
    read(Weight),
    write('Enter height in metres:'), nl,
    read(Height),
    bmi(Weight, Height, Result),
    write('Result = '),
    write(Result), nl.
