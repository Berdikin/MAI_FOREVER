#№ Отчет по лабораторной работе №2
## по курсу "Логическое программирование"

## Решение логических задач

### студент: Бердикин Т. А.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|     22.11    |      4-       |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*: Оценка сложности?


## Введение

Существует 2 основных подхода к решению логических задач: метод порождения и проверок и метод ветвей и границ. Они оба перебирают некоторый набор решений. Суть первого метода состоит в том, что некоторый предикат генерирует множество исходных данных, которые затем проверяются другими предикатами на предмет соответствия условию задачи. В случае неуспеха происходит возврат и рассмотрение следующего решения, в случае успеха полученное решение возвращается пользователю или используется дальше. Второй метод можно противопоставить первому. Главным отличием метода ветвей и границ от предыдущего метода является отсечение неподходящих решений в самом начале и рассмотрение только удовлетворяющих предыдущему условию ветвей решений. Благодаря перебору каждого возможного варианта решения, Пролог удобен для решения логических задач, потому что он дает возможность рассмотрения большого количества вариантов решения задачи и выбора из них подходящих. Механизм бэктрекинга при обнаружении неуспеха автоматически пересматривает решение и пытается продолжить выполнение программы при других значениях переменных.
## Задание
В одном городе живут 7 любителей птиц. И фамилии у них птичьи. Каждый из них тезка птицы, которой владеет один из его товарищей. У троих из них живут птицы, которые темнее, чем пернатые "тезки" их хозяев. "Тезка" птицы, которая живет у Воронова, женат. Голубев и Канарейкин единственные холостяки из всей компании. Хозяин грача женат на сестре жены Чайкина. Невеста хозяина ворона очень не любит птицу, с которой возится ее жених. "Тезка" птицы, которая живет у Грачева, хозяин канарейки. Птица, которая является "тезкой" владельца попугая, принадлежит "тезке" той птицы, которой владеет Воронов. У голубя и попугая оперение светлое. Кому принадлежит скворец?
## Принцип решения

Всё просто. Факты типа tezka соотносят, как несложно догадаться, имена птиц и фамилии людей. Список Dark - для тёмных птичек. Также используются предикаты member, not - в основном для определения семейного статуса человека и связанных с этим условий, а также для поиска конкретных людей, о которых в условии сказано: "У троих из них живут птицы, которые темнее, чем пернатые «тезки» их хозяев". С помощью предиката permutation пробегаемся по всем возможным вариантам и находим единственно верное решение с предикатом solve. После компиляции программы необходимо задать вопрос
? - solve (X, Y). , где X - это вывод всех владельцев с птицами (можно опустить при помощи _ ), а Y - искомый ответ, определяющий владельца скворца. Засим предлагаю взглянуть на код с подробными комментариями.

{Ответ?}

## Выводы
Эта лабораторная работа была для меня достаточно сложной. В первую очередь, потому что я категорически не хотел использовать полный перебор, чтобы сделать программу максимально эффективной, но, к сожалению, этого у меня не вышло. 
Вообще можно было использовать несколько путей решения, и это заставляет задуматься об эффективности и вообще о выборе правильного пути. Пролог, безусловно, эффективный язык программирования, но ведь выбор пути решения всё равно остаётся за человеком, зачастую неспособным указать Прологу на самый быстрый путь. И всё же, мощь Пролога поражает. Вручную перебирать несколько тысяч вариантов будет достаточно проблематично. А при похожих по смыслу задачах достаточно лишь поменять предикаты с условиями и генерацию. Считаю, что если достаточно формализовать условия этой задачи и похожих, то можно писать легкокорректируемые программы на Прологе, которые помогут решать нам целые классы таких задач.


