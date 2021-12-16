#№ Отчет по лабораторной работе №4
## по курсу "Логическое программирование"

## Обработка естественного языка

### студент: Бердикин Т. А.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|   13.12      |      5-       |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*: Отсутствует описание грамматики


## Введение

Существует 2 основных подхода к обработке языков - статистический и лингвистический. В основе статистического подхода лежит предположение, что содержание текста отражается наиболее часто встречающимися словами. Суть этого анализа заключается в подсчете количества вхождений слов в текст. Лингвистический подход основан на лингвистическом анализе, который представляет собой 4 уровня анализа входных данных: графематический (отдельные слова), морфологический (морфологические характеристики слов), синтаксический (зависимости слов в предложении), семантический (смысл высказывания).

Пролог имеет большие возможности по сопоставлению объектов с эталоном (pattern matching), поэтому великолепно подходит для обработки текстов. На Прологе можно легко реализовать текстовые редакторы, трансляторы языков и даже генераторы отчётов. В интерпретаторе Пролога по умолчанию принята стратегия решения задач с обратным ходом решения. Т.е. решение начинается с запроса, которое разбивается на подцели правила, далее делится на еще более мелкие составные части и т.д. На ней же базируется и система нисходящего грамматического разбора. Поэтому реализация такого разбора на Прологе осуществляется достаточно прямолинейно.

## Задание

2.Реализовать разбор предложений английского языка. В предложениях у объекта(подлежащего) могут быть заданы цвет, размер, положение. В результате разбора должны получиться структуры, представленные в примере. ............................................................................................................ 
Запросы:
?- sentence([“The”, “ big”, “ book”, “ is”, “ under”, “ the”, “ table”,X).
?- sentence([“The”, “ red”, “ book”, “ is”, “ on”, “ the”, “ table”,X).
?- sentence([“The”, “ little”, “ pen”, “ is”, “ red”,X).
Результаты:
X= s(location(object(book,size(big)), under(table))),
X= s(location(object(book, color(red)), on(table))),
X= s(object(pen,size(little)), color(red)). 

## Принцип решения

С помощью определённых предикатов определяем возможные объекты, их цвета, размеры и расположение. Ищем элемент из списка. Подтверждаем/не подтверждаем вхождение в определенный список. Определяем счетчик слов определенного типа(цвет, размер и т.д.)
Определяем возможные предложения. И таким образом выдаём пользователю все данные. Подробнее - в файле с программой.

## Результаты

?- sentence(["The", "big", "book", "is", "under", "the", "table"], X);
sentence(["The", "red", "book", "is", "on", "the", "table"], X);
sentence(["The", "little", "pen", "is", "red"], X).
X = s(location(object("book", size("big"))), under("table")) ;
X = s(location(object("book", colour("red"))), on("table")) ;
X = s(object("pen", size("little")), colour("red")) .

## Выводы

Пролог, несомненно, удобный и практичный язык. Он, как много раз говорилось ранее, даёт потрясающие и совершенно иные возможности для написания программ, чем императивные ЯП. Вот только базу данных каждый раз приходится создавать ручками, что, конечно же, очень сильно огорчает. Для решения задач грамматического разбора тоже удобно использовать Пролог - достаточно написать несколько правил, чтобы реализовать разбор предложений определённого типа на английском языке.


