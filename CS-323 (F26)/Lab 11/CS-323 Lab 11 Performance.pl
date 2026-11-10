% % Lab 11: Company Loan Advisor Expert System 


% --- Declarative Decision Rules ---

% Direct Approval: Full-time employee with over 3 years of service
loan_decision(yes, over_3_yrs, _, _, grant_loan) :- !.

% Direct Rejection: Part-time employee with 5 years or less of service
loan_decision(no, under_or_5_yrs, _, _, no_loan) :- !.

% Merged Borderline Cases (Full-time <= 3 yrs OR Part-time > 5 yrs):
% Evaluates previous loan history
loan_decision(_, _, no, _, no_loan) :- !.
loan_decision(_, _, yes, no, no_loan) :- !.
loan_decision(_, _, yes, yes, grant_loan) :- !.


start :-
    write('Are you a full-time employee? (yes/no): '), nl,
    read(FullTime),
    nl,
    
    % Check service duration based on employment status
    ( FullTime == yes ->
        write('Have you worked for over 3 years? (yes/no): '), nl,
        read(Ans3Yrs),
        ( Ans3Yrs == yes ->
            Service = over_3_yrs,
            loan_decision(FullTime, Service, _, _, Decision)
        ;
            Service = under_or_3_yrs,
            check_previous_history(FullTime, Service, Decision)
        )
    ;
        write('Have you worked for over 5 years? (yes/no): '), nl,
        read(Ans5Yrs),
        ( Ans5Yrs == no ->
            Service = under_or_5_yrs,
            loan_decision(FullTime, Service, _, _, Decision)
        ;
            Service = over_5_yrs,
            check_previous_history(FullTime, Service, Decision)
        )
    ),
    
    nl,
    write('FINAL DECISION: '), write(Decision), nl,
   


% Helper predicate to evaluate previous loan history for borderline cases
check_previous_history(FullTime, Service, Decision) :-
    write('Had a previous company loan? (yes/no): '), nl,
    read(PrevLoan),
    ( PrevLoan == no ->
        loan_decision(FullTime, Service, no, _, Decision)
    ;
        write('Was the previous loan repaid on time? (yes/no): '), nl,
        read(RepaidOnTime),
        loan_decision(FullTime, Service, yes, RepaidOnTime, Decision)
    ).