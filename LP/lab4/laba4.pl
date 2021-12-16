%Определение возможных, объектов, их цветов, размеров и расположений

object_list(["pen", "book"]).
colour_list(["red", "green"]).
size_list(["big", "little"]).
position_list(["on", "under"]).
place_list(["table"]).
location(X, [["on", on(X)], ["under", under(X)]]).

%-------------------------------------------------------------------

%Определяем поиск элемента из списка
find([First|_], First).
find([_|End_list], First):- find(End_list, First).

%-------------------------------------------------------------------

%Определение предикатов подтверждения вхождения в определенный список
object(X) :- object_list(List), find(List, X).
colour(X) :- colour_list(List), find(List, X).
size(X) :- size_list(List), find(List, X).
place(X) :- place_list(List), find(List, X).
position(X) :- position_list(List), find(List, X).
%-------------------------------------------------------------------

%Определяем счетчик слов определенного типа(цвет, размер и т.д.)
number([], _, 0).
number([First|End_list], List, Number):- number(End_list, List, Number_1),
                                         find(List, First),
                                         Number = Number_1 + 1.
number([First|End_list], List, Number):- number(End_list, List, Number_1),
                                         not(find(List, First)),
                                         Number = Number_1.

%-------------------------------------------------------------------

%Определение возможных предложений
%O - object, S - size, C - colour, P - place, Pos - position
sentence(Offer, s(location(object(O, size(S))), X)):- find(Offer, O), object(O),
                                                      find(Offer, S), size(S),
                                                      colour_list(List), number(Offer, List, 0),
                                                      find(Offer, P), place(P),
                                                      find(Offer, Pos), position(Pos),
                                                      location(P, Location_lists), find(Location_lists, [Pos, X]).

sentence(Offer, s(location(object(O, colour(C))), X)):- find(Offer, O), object(O),
                                                        find(Offer, C), colour(C),
                                                        size_list(List), number(Offer, List, 0),
                                                        find(Offer, P), place(P),
                                                        find(Offer, Pos), position(Pos),
                                                        location(P, Location_lists), find(Location_lists, [Pos, X]).


sentence(Offer, s(object(O, size(S)), colour(C))):- find(Offer, O), object(O),
                                                    find(Offer, S), size(S),
                                                    find(Offer, C), colour(C),
                                                    position_list(List), number(Offer, List, 0).