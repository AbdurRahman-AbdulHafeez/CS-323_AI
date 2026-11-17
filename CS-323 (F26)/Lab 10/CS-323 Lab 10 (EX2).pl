% Exercise 02

comfortable(islamabad).
comfortable(peshawar).
hot_area(karachi).
hot_area(lahore).
chilly(quetta).

good_for_travel(X) :- 
    comfortable(X), 
    \+ hot_area(X).

avoid_travel(X) :- 
    chilly(X) ; 
    hot_area(X).

moderate_advice(X) :- 
    \+ good_for_travel(X), 
    \+ avoid_travel(X).