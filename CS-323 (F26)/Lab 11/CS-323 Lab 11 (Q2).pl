% Exercise 02

diagnose :-
    write('Please answer the following symptoms with yes or no (followed by a period .):'), nl, nl,
    
    write('Do you have a dry cough? '), read(DryCough),
    write('Do you have general malaise? '), read(GeneralMalaise),
    write('Do you have a fever? '), read(Fever),
    write('Do you have a running nose? '), read(RunningNose),
    write('Do you have sneezing? '), read(Sneezing),
    
    % Ask about allergies only if running nose and sneezing are present
    ( (RunningNose == yes, Sneezing == yes) ->
        write('Do you have any allergies? '), read(Allergies)
    ;   Allergies = no
    ),
    
    write('Are you breathless? '), read(Breathless),
    write('Are you wheezing? '), read(Wheezing),
    nl,
    
    % Evaluate symptoms against rules
    evaluate_symptoms(DryCough, GeneralMalaise, Fever, RunningNose, Sneezing, Allergies, Breathless, Wheezing).


evaluate_symptoms(no, no, no, no, no, _, no, no) :-
    write('Result: Guess you are ok.'), nl.

evaluate_symptoms(yes, yes, no, no, no, _, no, no) :-
    write('Result: You may have Influenza.'), nl.

evaluate_symptoms(yes, yes, yes, no, no, _, no, no) :-
    write('Result: You may have Laryngitis.'), nl.

evaluate_symptoms(no, no, _, yes, yes, yes, no, no) :-
    write('Result: You may have hay fever.'), nl.

evaluate_symptoms(no, no, _, yes, yes, no, no, no) :-
    write('Result: You may have common cold.'), nl.

evaluate_symptoms(no, no, _, no, no, _, yes, yes) :-
    write('Result: You may have asthma.'), nl.

evaluate_symptoms(_, _, _, _, _, _, _, _) :-
    write('Result: System cannot diagnose (It can’t diagnose this combination).'), nl.