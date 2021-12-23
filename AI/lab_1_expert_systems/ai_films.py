from pyknow import *
def print_list(my_list):
    for el in my_list:
        print(el)

class Film(KnowledgeEngine):
    result=[]

    @Rule(OR(Fact(age='подросток(13-18)'),
        Fact('необычные способности')))
    def unreal_heroes(self):
        self.declare(Fact('нравится смотреть на вымышленных\несуществующих героев'))

    @Rule(Fact(age='подросток(13-18)'))
    def unreal_history(self):
        self.declare(Fact('нравятся вымышленные истории'))

    @Rule(Fact(age='старше 40'))
    def world_news(self):
        self.declare(Fact('информация про мировые события'))

    @Rule(OR(Fact(grad='высшее образование'),Fact(grad='неоконченное высшее образование'),Fact(age='подросток(13-18)'),Fact(age='половозрелый(19-40)')))
    def found_of_history(self):
        self.declare(Fact('увлекаемся историей'))
    
    @Rule(OR(Fact('нравится сакура'),Fact('нравятся самураи'),Fact('нравится кимоно')))
    def japan_cul(self):
        self.declare(Fact('нравится японская культурая'))
    
    @Rule(AND(Fact('нравится смотреть на вымышленных\несуществующих героев'),Fact('нравятся вымышленные истории')))
    def unreal_screen(self):
        self.declare(Fact('несуществующий сюжет'))

    @Rule(OR(AND(Fact(sex='женщина'),Fact(age='половозрелый(19-40)')),Fact(temp='флегматик'),Fact(temp='сагвинник'),Fact(temp='меланхолик')))
    def emotional(self):
        self.declare(Fact('хочется эмоционального'))

    @Rule(OR(AND(Fact(sex='мужчина'),Fact(age='половозрелый(19-40)')),Fact(temp='холерик'),Fact('драки'),Fact('убийства')))
    def cruel(self):
        self.declare(Fact('нравится жестокость'))

    @Rule(OR(Fact(age='половозрелый(19-40)'),Fact('нравится борьба двух сторон')))
    def tension(self):
        self.declare(Fact('нравится напряжение'))

    @Rule(OR(Fact('нравятся самураи'),Fact('нравится оружие'),AND(Fact(sex='мужчина'),Fact(age='половозрелый(19-40)'),
    Fact('нравится военная техника'),Fact('нравится военная культура'))))
    def military(self):
        self.declare(Fact('нравится военная тема'))

    @Rule(AND(Fact('нравится напряжение'),Fact('стилистические фильмы')))
    def dark_cadr(self):
        self.declare(Fact('нравятся "тёмные" кадры'))

    @Rule(OR(Fact('мрачная атмосфера'),Fact('малое количество диалогов')))
    def style_film(self):
        self.declare(Fact('стилистические фильмы'))

    @Rule(OR(Fact('нравятся животные'),Fact('увлекаемся историей'),Fact('информация про мировые события'),Fact('Пораскинуть мозгами')))
    def education(self):
        self.declare(Fact(film='документальные'))

    @Rule(AND(Fact('несуществующий сюжет'),Fact('нравится японская культурая')))
    def anime(self):
        self.declare(Fact(film='аниме'))

    @Rule(AND(Fact('несуществующий сюжет'),Fact('увлекаемся историей')))
    def fantastic(self):
        self.declare(Fact(film='фантастика'))
    
    @Rule(AND(Fact('есть дети (<12)'),OR(Fact('элемент сказок'),Fact('нравятся абсурдные ситуации')),Fact('семья')))
    def cartoon(self):
        self.declare(Fact(film='мультфильмы'))
    
    @Rule(AND(Fact('грустный фильм'),Fact('хочется эмоционального')))
    def drama(self):
        self.declare(Fact(film='драмма'))

    @Rule(AND(Fact('семья'),Fact('хочется эмоционального'),OR(Fact('хочется посмеяться'),Fact('нравятся абсурдные ситуации'))))
    def comedy(self):
        self.declare(Fact(film='комедия'))
    

    @Rule(AND(Fact('нравится напряжение'),Fact('хочется эмоционального'),Fact('нравится жестокость'),Fact('нравится военная тема')))
    def boevik(self):
        self.declare(Fact(film='военные\боевики'))

    @Rule(AND(Fact('нравятся страшные истории'),Fact('хочется эмоционального')))
    def screamer(self):
        self.declare(Fact(film='ужасы'))

    @Rule(AND(Fact('Пораскинуть мозгами'),Fact('нравятся "тёмные" кадры')))
    def nuar(self):
        self.declare(Fact(film='нуар'))
    
    @Rule(AND(Fact('нравится напряжение'),Fact('стилистические фильмы')))
    def vestern(self):
        self.declare(Fact(film='вестерн'))

    @Rule(AND(Fact('нравится заниматься спортом'),Fact('информация про мировые события')))
    def sport(self):
        self.declare(Fact(film='спорт'))

        
    @Rule(Fact(film=MATCH.a))
    def print_result(self,a):
        self.result.append(a)
        print(f'Жанр- {a}')
                    
    def factz(self,l):
        for x in l:
            self.declare(x)

user_ans=[]
my_questions={'Сколько лет?':['0.подросток(13-18)','1.половозрелый(19-40)','2.старше 40'],'Вы?':['0.мужчина','1.женщина'],'У Вас?':['0.неоконченное высшее образование','1.высшее образование'],
'Ваш темперамент?':['0.холерик','1.флегматик','2.сагвинник','3.меланхолик'],'необычные способности?':['0.да','1.нет'],'нравится сакура?':['0.да','1.нет'],
'нравятся самураи?':['0.да','1.нет'],'нравится кимоно?':['0.да','1.нет'],'драки?':['0.да','1.нет'],'убийства?':['0.да','1.нет'],'нравится борьба двух сторон?':['0.да','1.нет'],
'нравится оружие?':['0.да','1.нет'],'нравится военная техника?':['0.да','1.нет'],'нравится военная культура?':['0.да','1.нет'],'мрачная атмосфера?':['0.да','1.нет'],
'малое количество диалогов?':['0.да','1.нет'],'нравятся животные?':['0.да','1.нет'],'есть дети (<12)?':['0.да','1.нет'],'элемент сказок?':['0.да','1.нет'],
'нравятся абсурдные ситуации?':['0.да','1.нет'],'нравятся абсурдные ситуации?':['0.да','1.нет'],'семья?':['0.да','1.нет'],'грустный фильм?':['0.да','1.нет'],
'нравятся страшные истории?':['0.да','1.нет'],'Пораскинуть мозгами?':['0.да','1.нет'],'нравится заниматься спортом?':['0.да','1.нет'],'хочется посмеяться?':['0.да','1.нет']}

for key in my_questions.keys():
    print(key)
    print_list(my_questions[key])
    user_answer=input()
    user_answer_list=[]
    for l in my_questions[key]:
        if l.find(user_answer+'.')>-1:
            user_answer_list=l.split('.')
    if user_answer_list[1]=='да':
        user_ans.append(key[:-1])
    elif user_answer_list[1]!='нет' :
        user_ans.append(user_answer_list[1])
ex1 = Film()
ex1.reset()


facts_my=[Fact(age=user_ans[0]),
        Fact(sex=user_ans[1]),
        Fact(grad = user_ans[2]),
        Fact(temp = user_ans[3])]

for i in range(4,len(user_ans)):
    facts_my.append(Fact(user_ans[i]))

#print(facts_my)
ex1.factz(facts_my)


ex1.run()
if len(ex1.result)==0:
    print('Увы, ничего нет:(')
print(ex1.facts)
