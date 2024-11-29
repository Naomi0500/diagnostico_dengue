% consult('c:/Users/Naomi/Desktop/tareaextraclase/diagnostico/diagnostico.pl').
% Hechos sobre síntomas 
sintoma(malestar_general).
sintoma(fiebre).
sintoma(tos).
sintoma(secreciones_nasales).
sintoma(dolor_de_cabeza).
sintoma(dolor_muscular).
sintoma(dolor_articular).
sintoma(rash).
sintoma(hemorragia_inusual).

% Diagnóstico de gripe
diagnostico(gripe) :- 
    sintoma(malestar_general),
    sintoma(fiebre),
    sintoma(tos),
    sintoma(secreciones_nasales).

% Diagnóstico de dengue
diagnostico(dengue) :- 
    sintoma(malestar_general),
    sintoma(fiebre),
    (sintoma(dolor_de_cabeza); sintoma(dolor_muscular); sintoma(dolor_articular)),
    sintoma(rash).

% Diagnóstico de dengue hemorrágico
diagnostico(dengue_hemorragico) :- 
    diagnostico(dengue),
    sintoma(hemorragia_inusual).


% Regla para diagnosticar
% La regla diagnosticar/2 toma una lista de síntomas.
% como entrada y devuelve el diagnóstico correspondiente.

diagnosticar(Sintomas, Resultado) :-
    findall(S, (member(S, Sintomas), sintoma(S)), SintomasEncontrados),
    (   length(SintomasEncontrados, N), N >= 3 -> 
        (   member(hemorragia_inusual, Sintomas) -> 
            Resultado = 'Dengue Hemorrágico' 
        ;   
            Resultado = 'Dengue'
        )
    ;   
        Resultado = 'Gripe'
    ).


