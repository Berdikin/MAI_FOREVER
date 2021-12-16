move([],[]).
move([[A|AA], [], R],[AA, B1, R1]):-
    (R \= [A|_]->
         B1 = [], R1 = [A|R] % МИНУЯ тупик
     ; B1 = [A], R1 = R % В тупик
    ).
move([[], [B|BB], R], [[], BB, [B|R]]):- R \= [B|_]. % ИЗ тупика
move([[A|AA], [B|BB], [C|_]], [A1, B1, C1]):-
    unify_with_occurs_check([A|AA], A0), unify_with_occurs_check([B|BB], B0), unify_with_occurs_check([C|_], C0),
    ( A = C ->
          ( B = C ->
                A1 = AA, B1 = [A|B0], C1 = C0 % В тупик
           ; A1 = A0, B1 = BB, C1 = [B|C0] % ИЗ тупика
          )
     ; A1 = AA, B1 = B0, C1 = [A|C0] % МИНУЯ тупик
    ).

% Попытка шага

prolong([Temp|Tail], [New, Temp|Tail]):- 
    move(Temp, New), not(member(New, [Temp|Tail])).

% Поиск в глубину

search_dpth(Start, Finish):- dpth([Start], Finish, Way), show_answer(Way).
dpth([Finish|Tail], Finish, [Finish|Tail]).
dpth(TempWay, Finish, Way):- 
    prolong(TempWay, NewWay), dpth(NewWay, Finish, Way).

% Поиск в ширину

search_bdth(Start, Finish):- bdth([[Start]], Finish, Way), show_answer(Way).
bdth([[Finish|Tail]|_], Finish, [Finish|Tail]).
bdth([TempWay|OtherWays], Finish, Way):- 
    findall(W, prolong(TempWay, W), Ways), 
    append(OtherWays, Ways, NewWays), 
    bdth(NewWays, Finish, Way).

% Поиск итерационный

int(1).
int(N):- int(M), N is M+1.
search_id(Start, Finish):- 
    int(Level), (Level>100, !;id([Start], Finish, Way, Level), show_answer(Way)). 
id([Finish|Tail], Finish, [Finish|Tail], 0).
id(TempWay, Finish, Way, N):- N > 0, 
    prolong(TempWay, NewWay), N1 is N-1, 
    id(NewWay, Finish, Way, N1).

% Вывод пути

show_answer([_]):- !.
show_answer([A, B|Tail]):- 
    show_answer([B|Tail]), nl, write(B), write(' -> '), write(A).
