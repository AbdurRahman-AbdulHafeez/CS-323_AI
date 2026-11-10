% Exercise 02 

% walk(Weather, Physical Limitations, Safe Time, Energy Levels, Decision)

walk('Hot & Dry', _, _, _, 'Dont Go!').
walk('Hot & Windy', yes, _, _, 'Dont Go!').
walk('Hot & Windy', no, yes, high, 'Go For Walk').
walk('Hot & Windy', no, yes, moderate, '15-20 Minutes Walk').
walk('Hot & Windy', no, yes, low, 'Gentle Stroll').
walk('Hot & Windy', no, no, _, 'Dont Go!').
walk('Cold & Wet', yes, _, _, 'Dont Go!').
walk('Cold & Wet', no, yes, high, 'Go For Walk').
walk('Cold & Wet', no, yes, moderate, '15-20 Minutes Walk').
walk('Cold & Wet', no, yes, low, 'Gentle Stroll').
walk('Cold & Wet', no, no, _, 'Dont Go!').


start :-
    write('Weather? (Hot & Dry / Hot & Windy / Cold & Wet)'), nl,
    read(Weather),
    write('Physical Limitation? (yes / no)'), nl,
    read(PhysicalLimitation),
    write('Safe Time? (yes / no)'), nl,
    read(SafeTime),
    write('Energy Level? (high / moderate / low)'), nl,
    read(EnergyLevel),
    walk(Weather, PhysicalLimitation, SafeTime, EnergyLevel, Decision),
    write('Decision: '), 
    write(Decision), nl.
