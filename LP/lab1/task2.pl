% Task 2: Relational Data

% предмет
% сокращённое название, полное название
subject('LP','Логическое программирование').
subject('MTH','Математический анализ').
subject('FP','Функциональное программирование').
subject('INF','Информатика').
subject('ENG','Английский язык').
subject('PSY','Психология').

%оценка
%предмет - оценка
%студент
%группа - фамилия - список оценок
student(102,'Петров',[grade('LP',3),grade('MTH',4),grade('FP',4),grade('INF',4),grade('ENG',5),grade('PSY',4)]).
student(101,'Петровский',[grade('LP',5),grade('MTH',4),grade('FP',3),grade('INF',4),grade('ENG',2),grade('PSY',4)]).
student(104,'Иванов',[grade('LP',4),grade('MTH',5),grade('FP',5),grade('INF',4),grade('ENG',3),grade('PSY',3)]).
student(102,'Ивановский',[grade('LP',3),grade('MTH',4),grade('FP',3),grade('INF',3),grade('ENG',3),grade('PSY',5)]).
student(104,'Запорожцев',[grade('LP',3),grade('MTH',3),grade('FP',3),grade('INF',5),grade('ENG',5),grade('PSY',2)]).
student(101,'Сидоров',[grade('LP',5),grade('MTH',3),grade('FP',5),grade('INF',5),grade('ENG',4),grade('PSY',2)]).
student(103,'Сидоркин',[grade('LP',4),grade('MTH',4),grade('FP',2),grade('INF',3),grade('ENG',4),grade('PSY',3)]).
student(102,'Биткоинов',[grade('LP',4),grade('MTH',5),grade('FP',5),grade('INF',3),grade('ENG',3),grade('PSY',4)]).
student(103,'Эфиркина',[grade('LP',4),grade('MTH',5),grade('FP',3),grade('INF',3),grade('ENG',4),grade('PSY',4)]).
student(103,'Сиплюсплюсов',[grade('LP',3),grade('MTH',5),grade('FP',3),grade('INF',4),grade('ENG',3),grade('PSY',4)]).
student(103,'Программиро',[grade('LP',3),grade('MTH',5),grade('FP',4),grade('INF',3),grade('ENG',5),grade('PSY',4)]).
student(104,'Джаво',[grade('LP',5),grade('MTH',4),grade('FP',4),grade('INF',5),grade('ENG',3),grade('PSY',4)]).
student(103,'Клавиатурникова',[grade('LP',3),grade('MTH',2),grade('FP',3),grade('INF',2),grade('ENG',5),grade('PSY',4)]).
student(101,'Мышин',[grade('LP',5),grade('MTH',5),grade('FP',2),grade('INF',4),grade('ENG',4),grade('PSY',2)]).
student(104,'Фулл',[grade('LP',5),grade('MTH',4),grade('FP',5),grade('INF',4),grade('ENG',4),grade('PSY',4)]).
student(101,'Безумников',[grade('LP',5),grade('MTH',4),grade('FP',4),grade('INF',4),grade('ENG',5),grade('PSY',4)]).
student(102,'Шарпин',[grade('LP',4),grade('MTH',3),grade('FP',2),grade('INF',3),grade('ENG',3),grade('PSY',4)]).
student(104,'Круглосчиталкин',[grade('LP',5),grade('MTH',4),grade('FP',4),grade('INF',4),grade('ENG',2),grade('PSY',4)]).
student(103,'Решетников',[grade('LP',3),grade('MTH',3),grade('FP',5),grade('INF',5),grade('ENG',5),grade('PSY',4)]).
student(102,'Эксель',[grade('LP',4),grade('MTH',4),grade('FP',4),grade('INF',4),grade('ENG',4),grade('PSY',3)]).
student(102,'Текстописов',[grade('LP',5),grade('MTH',4),grade('FP',5),grade('INF',2),grade('ENG',3),grade('PSY',4)]).
student(103,'Текстописова',[grade('LP',3),grade('MTH',4),grade('FP',3),grade('INF',4),grade('ENG',4),grade('PSY',4)]).
student(101,'Густобуквенникова',[grade('LP',4),grade('MTH',5),grade('FP',4),grade('INF',4),grade('ENG',5),grade('PSY',4)]).
student(102,'Криптовалютников',[grade('LP',4),grade('MTH',3),grade('FP',4),grade('INF',4),grade('ENG',3),grade('PSY',4)]).
student(104,'Блокчейнис',[grade('LP',4),grade('MTH',2),grade('FP',5),grade('INF',2),grade('ENG',5),grade('PSY',3)]).
student(102,'Азурин',[grade('LP',5),grade('MTH',2),grade('FP',5),grade('INF',5),grade('ENG',4),grade('PSY',5)]).
student(103,'Вебсервисов',[grade('LP',4),grade('MTH',5),grade('FP',4),grade('INF',5),grade('ENG',4),grade('PSY',4)]).
student(102,'Круглотличников',[grade('LP',3),grade('MTH',4),grade('FP',5),grade('INF',3),grade('ENG',4),grade('PSY',5)]).

% Принадлежность элемента списку
% (элемент, список)
my_member(X, [X|_]).
my_member(X, [_|T]):-my_member(X, T).

%сумма оценок
sum_grades([], 0).
sum_grades([grade(_, Y)|T], X):- sum_grades(T, X1), X is Y+X1.
% средний балл студента по всем предметам
% группа студента, фамилия, средний балл
average_mark(G, X, Y):- student(G, X, L), sum_grades(L, Y1), Y is Y1/6, !.

didpass([]).
didpass([grade(_, Y)|T]):- Y\=2, didpass(T).
%студент
student_passed(X):- student(_, X, L), didpass(L), !.

sub(X, [], 0).
sub(X, [S|T], Y):- my_member(grade(X, 2), S), sub(X, T, Y1), Y is Y1+1, !; sub(X, T, Y2), Y is Y2, !.
%предмет, кол-во студентов, не сдавших его
sub_did_not_passed(X, Y):- subject(X1, X), !, findall(Z, student(_, _, Z), L), sub(X1, L, Y).

average_mark_for_list([], 0).
average_mark_for_list([X|T], Y):- average_mark(_, X, Y1), average_mark_for_list(T, Y2), (Y1 >= Y2, Y is Y1; Y is Y2).
max_average_mark(G, X):- findall(Z, student(G, Z, _), L), average_mark_for_list(L, X).
%группа, студенты с максимальным баллом в ней
max_mark_students(G, L):- max_average_mark(G, T), findall(Y, average_mark(G, Y, T), L), !.
