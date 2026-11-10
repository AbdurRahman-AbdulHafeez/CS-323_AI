% Exercise 01

% employee(Name(N), Age(A), Years of Service(S))

employee(ali,17,1).
employee(babar,60,24).
employee(karim,50,32).
employee(ahsan,35,17).
employee(agha,46,22).

extra5(A,S,5) :- (A<18; A>=60; S>=30), !.
extra5(_,_,0).
extra2(A,S,2) :- (S>=15, S<30; A>=45), !.
extra2(_,_,0).
extra3(A,S,3) :- (S>=30; A>=60), !.
extra3(_,_,0).

holidays(N,H) :- employee(N,A,S), extra5(A,S,E5), extra2(A,S,E2), 
                 extra3(A,S,E3),
                 H is 22 + E5 + E2 + E3.

start :-
    write('To find your number of holidays:'), nl,
    write('Type your queries such as:'), nl,
    write('?- employee(Name,Age,Service).'), nl,
    write('?- holidays(ali,H). % H = 27'), nl,       
    write('?- holidays(babar,H). % H = 32'), nl,
    write('?- holidays(karim,H). % H = 30'), nl,
    write('?- holidays(ahsan,H). % H = 24'), nl,
    write('?- holidays(agha,H). % H = 24'), nl,     
    write('?- holidays(Name,H)'). % Lists all employees with total holidays

