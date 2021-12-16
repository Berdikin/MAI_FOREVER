parents('Тимофей Бердикин','Алексей Бердикин','Екатерина Грынина').
parents('Иван Бердикин','Алексей Бердикин','Екатерина Грынина').
parents('Наталья Грынина','Валерий Грынин','Эмилия Мальченко').
parents('Екатерина Грынина','Валерий Грынин','Эмилия Мальченко').
parents('Алексей Бердикин','Сергей Бердикин','Галина Батова').
parents('Галина Батова','Михаил Батов','Нина Колесова').
parents('Анастасия Колесова','Порфирий Колесов','Василиса Колпакова').
parents('Мария Колесова','Порфирий Колесов','Василиса Колпакова').
parents('Нина Колесова','Порфирий Колесов','Василиса Колпакова').
parents('Александр Колесов','Порфирий Колесов','Василиса Колпакова').
parents('Иван Колесов','Порфирий Колесов','Василиса Колпакова').
parents('Людмила Симонова','Василий Симонов','Анастасия Колесова').
parents('Василий Симонов','Людмила Симонова','Мария Колесова').
parents('Степан Симонов','Людмила Симонова','Мария Колесова').
parents('Александр Базанов','Сергей Базанов','Клавдия Голубева').
parents('Виктор Симонов','Степан Симонов','Клавдия Голубева').
parents('Клавдия Голубева','Алексей Голубев','Прасковья Неизвестно').
parents('Прасковья Неизвестно','Демьян Неизвестно','Прасковья Неизвестно').
parents('Сергей Самсонов','Константин Самсонов','Наталья Грынина').
parents('Ольга Самсонова','Константин Самсонов','Наталья Грынина').
parents('Алексей Самсонов','Неизвестно Самсонов','Наталья Грынина').
parents('Константин Самсонов','Неизвестно Самсонов','Наталья Грынина').
parents('Александра Самсонова','Алексей Самсонов','Надежда Неизвестно').
parents('Егор Самсонов','Алексей Самсонов','Надежда Неизвестно').
parents('Надежда Самсонова','Сергей Самсонов','Маргарита Неизвестно').
parents('Эмилия Мальченко','Петр Мальченко','Рива Беленькая').

child(Person,Y) :- % "Person" - ребенок у "Y"
    parents(Person, Y, Z);
    parents(Person, Z, Y).

subling(Person,Y) :- % Брат или сестра
    parents(Person, U, V),
    parents(Y, U, V),
    Person \= Y.

check_link(husband, Husband, Wife):-
    parents(Person, Husband, Wife).

check_link(wife, Wife, Husband):-
    parents(Person, Husband, Wife).

check_link(father, Father, Child):-
    parents(Child, Father, Mother).

check_link(mother, Mother, Child):-
    parents(Child, Father, Mother).

check_link(parent, Parent, Child):-
    child(Child, Parent).

check_link(child, Child, Parent):-
    child(Child, Parent).

check_link(subling, Brother, Y):-
    subling(Brother, Y).

check_relation(X):-
    member(X, [father, mother, subling, child, husband, wife]).


/*          Степень родства          */
relative_thread(X, Y, Res):- % цепочка людей, через которых связаны 2 человека
    search_bdth(X, Y, Res).

ask_relative(X, Y, Res):- % цепочка родства, через которую связаны 2 человека
    check_relation(Res), !,
    check_link(Res, X, Y).

relative(X, Y, Res):-
    search_bdth(X, Y, Res1), !,
    transform(Res1, Res).

transform([_],[]):-!. % переделать цепочку родственников в цепочку родства
transform([First,Second|Tail],ResList):-
    check_link(Relation,First,Second),
    ResList = [Relation|Tmp],
    transform([Second|Tail],Tmp),!.

prolong([X|T],[Y,X|T]):-
   move(X,Y),
   \+ member(Y,[X|T]).

move(X,Y):-
   check_link(_,X,Y).

search_bdth(X,Y,P):-
    bdth([[X]],Y,L),
    reverse(L,P).

bdth([[X|T]|_],X,[X|T]).
bdth([P|QI],X,R):-
    findall(Z,prolong(P,Z),T),
    append(QI,T,Q0),
    bdth(Q0,X,R),!.

bdth([_|T],Y,L):-
    bdth(T,Y,L).
