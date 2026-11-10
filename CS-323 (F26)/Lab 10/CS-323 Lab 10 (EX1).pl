% Exercise 01

% Facts Creation

population(karachi, 15000000).
population(lahore, 11000000).
population(islamabad, 2000000).
population(quetta, 1000000).
population(peshawar, 2500000).

% Rules Definition

largeCity(X) :- population(X, P), P > 5000000.
smallCity(X) :- population(X, P), P < 3000000.

populationGreaterThan2000000(X) :- population(X, P), P > 2000000.
