/*Вариант 2
В одном городе живут 7 любителей птиц. И фамилии у них птичьи. Каждый из них — «тезка» птицы, которой владеет 
один из его товарищей. У троих из них живут птицы, которые темнее, чем пернатые «тезки» их хозяев. «Тезка» птицы,
которая живет у Воронова, женат. Голубев и Канарейкин — единственные холостяки из всей компании. Хозяин грача 
женат на сестре жены Чайкина. Невеста хозяина ворона очень не любит птицу, с которой возится ее жених. «Тезка»
птицы, которая живет у Грачева,— хозяин канарейки. Птица, которая является «тезкой» владельца попугая, 
принадлежит «тезке» той птицы, которой владеет Воронов. У голубя и попугая оперение светлое.
Кому принадлежит скворец?
*/

tezka(raven,voronov).     %ворон     Rn
tezka(dove,golubev).      %голубь    D
tezka(canary,kanareikin). %канарейка C
tezka(rook,grachev).      %грач      Rk
tezka(gull,chaikin).      %чайка     G
tezka(parrot,popugaev).   %попугай   P
tezka(starling,skvorcov). %скворец   S

solve(Ans,StarlingOwner):-
    Ans=[voronov/A,golubev/B,kanareikin/C,grachev/D,chaikin/E,popugaev/F,skvorcov/G],
    permutation([raven,dove,canary,rook,gull,parrot,starling],[A,B,C,D,E,F,G]),  %генерация всевозможных перестановок
    A\=raven,B\=dove,C\=canary,D\=rook,E\=gull,F\=parrot,G\=starling,            %«тезка» птицы, которой владеет один из его товарищей.

    Dark=[raven,rook,starling],    % темные птицы
    
    % У троих из них живут птицы, которые темнее, чем пернатые «тезки» их хозяев
    member(RavenOwner/raven,Ans),tezka(TezkaRvRv,RavenOwner),not(member(TezkaRvRv,Dark)),
    member(RookOwner/rook,Ans),tezka(TezkaRkRk,RookOwner),not(member(TezkaRkRk,Dark)),
    member(StarlingOwner/starling,Ans),tezka(TezkaSS,StarlingOwner),not(member(TezkaSS,Dark)),

    not(tezka(A,golubev)),not(tezka(A,kanareikin)),  %Голубев и Канарейкин — холостяки из всей компании, а
                                                     %«Тезка» птицы, которая живет у Воронова, женат. 
    not(B=rook),not(C=rook),             %Хозяин грача женат
    not(RookOwner=chaikin),          %на сестре жены Чайкина => владелец грача - не Чайкин
    (B=raven ; C=raven),         %Невеста хозяина ворона... => хозяин ворона - кто-то из неженатых
    tezka(D,CanaryOwner),member(CanaryOwner/canary,Ans),     % «Тезка» птицы, которая живет у Грачева,— хозяин канарейки.
    member(ParrotOwner/parrot,Ans),tezka(TezkaRvP,ParrotOwner),
    member(TezkaRvPOwner/TezkaRvP,Ans),tezka(TezkaRvTRvP,TezkaRvPOwner),
    member(voronov/TezkaRvTRvP,Ans).       %Птица, которая является «тезкой» владельца попугая, 
                                           %принадлежит «тезке» той птицы, которой владеет Воронов
