---
# Front matter
lang: ru-RU
title: "Лабораторная работа №4. Модель гармонических колебаний."
subtitle: "Вариант №28"
author: "Евдокимов Иван Андреевич. НФИбд-01-20"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Содержание
toc-depth: 2
lof: true # Список рисунков
lot: true # Список таблиц
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---
# Цель работы

Изучить уравнение гармонического осцилятора без затухания. Записать данное уравнение и построить фазовый портрет гармонических и свободных колебаний. 


# Задание[@lab-task:mathmod]

1.	Построить решение уравнения гармонического осциллятора без затухания
2.	Записать уравнение свободных колебаний гармонического осциллятора с затуханием, построить его решение. Построить фазовый портрет гармонических колебаний с затуханием.
3.	Записать уравнение колебаний гармонического осциллятора, если на систему действует внешняя сила, построить его решение. Построить фазовый портрет колебаний с действием внешней силы.


# Выполнение лабораторной работы

## Теоретические сведения[@lab-example:mathmod]

Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в разных науках при определенных предположениях можно описать одним дифференциальным уравнением.
Это уравнение в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет вид:

$$\ddot{x}+2\gamma\dot{x}+\omega^2=0$$

где:

* $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), 
* $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), 
* $\omega$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.



При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.

$$\ddot{x}+\omega^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:

$$
 \begin{cases}
	x=y
	\\   
	y=-\omega^2x
 \end{cases}
$$

Начальные условия для системы примут вид:

$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

## Теоретические сведения

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.


## Условие задачи и пункты:

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев 

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы $\ddot{x}+4.7x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы $\ddot{x}+0.5\dot{x}+7x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы $\ddot{x}+7\dot{x}+0.5x=0.5\sin{0.7t}$

На итнтервале $t \in [ 0;56 ]$, шаг 0.05, $x_0=0.9, y_0=1.9$


## Код программы на Julia общий для трёх случаев[@diff-eq-doc:julia]: 


	# Вариант 28
	using Plots
	using DifferentialEquations
	
	x0 = 0.9
	y0 = 1.9
	
	function fn_1(du, u, p, t)
	    x, y = u
	    du[1] = u[2]
	    du[2] = -4.7*u[1]
	end
	
	function fn_2(du, u, p, t)
	    x, y = u
	    du[1] = u[2]
	    du[2] = -7*u[1] - 0.5*u[2]
	
	end
	
	function fn_3(du, u, p, t)
	    x, y = u
	    du[1] = u[2]
	    du[2] = -0.5*u[1] - 7*u[2] + 0.5*sin(0.7t)
	
	end
	
	v0 = [x0, y0]
	tspan = (0, 56)
	prob = ODEProblem(fn_1, v0, tspan)
	sol = solve(prob, dtmax=0.05)
	
	X1 = [u[1] for u in sol.u]
	Y1 = [u[2] for u in sol.u]
	T = [t for t in sol.t]
	
	plt = plot(
	  dpi=300,
	  title="Решение уравнения",
	  legend=false)
	
	plot!(
	  plt,
	  T,
	  X1,
	  color=:blue)
	
	plot!(
	  plt,
	  T,
	  Y1,
	  color=:red)
	
	plt2 = plot(
	  dpi=300,
	  title="Фазовый портрет",
	  legend=false)
	
	plot!(
	  plt2,
	  X1,
	  Y1,
	  color=:blue)
	
	v0 = [x0, y0]
	tspan = (0, 56)
	prob = ODEProblem(fn_2, v0, tspan)
	sol = solve(prob, dtmax=0.05)
	
	X2 = [u[1] for u in sol.u]
	Y2 = [u[2] for u in sol.u]
	T = [t for t in sol.t]
	
	plt3 = plot(
	  dpi=300,
	  title="Решение уравнения",
	  legend=false)
	
	plot!(
	  plt3,
	  T,
	  X2,
	  color=:blue)
	
	plot!(
	  plt3,
	  T,
	  Y2,
	  color=:red)
	
	plt4 = plot(
	  dpi=300,
	  title="Фазовый портрет",
	  legend=false)
	
	plot!(
	  plt4,
	  X2,
	  Y2,
	  color=:blue)
	
	v0 = [x0, y0]
	tspan = (0, 56)
	prob = ODEProblem(fn_3, v0, tspan)
	sol = solve(prob, dtmax=0.05)
	
	X3 = [u[1] for u in sol.u]
	Y3 = [u[2] for u in sol.u]
	T = [t for t in sol.t]
	
	plt5 = plot(
	  dpi=300,
	  title="Решение уравнения",
	  legend=false)
	
	plot!(
	  plt5,
	  T,
	  X3,
	  color=:blue)
	
	plot!(
	  plt5,
	  T,
	  Y3,
	  color=:red)
	
	plt6 = plot(
	  dpi=300,
	  title="Фазовый портрет",
	  legend=false)
	
	plot!(
	  plt6,
	  X3,
	  Y3,
	  color=:blue)
	
	
	savefig(plt, "lab04_1_1.png")
	savefig(plt2, "lab04_1_2.png")
	savefig(plt3, "lab04_2_1.png")
	savefig(plt4, "lab04_2_2.png")
	savefig(plt5, "lab04_3_1.png")
	savefig(plt6, "lab04_3_2.png")

## 1. В системе отсутствуют потери энергии (колебания без затухания)

Получаем уравнение 

$$\ddot{x}+\omega x=0$$

## Код программы на OpenModelica: 

	model laba4_1
	
	  Real x(start=0.9);
	  Real y(start=1.9);
	  parameter Real w( start=4.7);
	
	equation
	  der(x)= y;
	  der(y)= -w*x;
	  
	  annotation(experiment(StartTime=0, StopTime=56, Tolerance=1e-6, Interval=0.05));
	
	
	end laba4_1;


## Результат: 

![Фазовый портрет для случая 1 на OpenModelica](image/lab04_1_2_open.png){ #fig:001 width=70% height=70% }

![График решения для случая 1 на OpenModelica](image/lab04_1_1_open.png){ #fig:002 width=70% height=70% }

![Фазовый портрет для случая 1 на Julia](image/lab04_1_2.png){ #fig:001 width=70% height=70% }

![График решения для случая 1 на Julia](image/lab04_1_1.png){ #fig:002 width=70% height=70% }


## 2.  В системе присутствуют потери энергии (колебания с затуханием)

Получаем уравнение 

$$\ddot{x}+2\gamma\dot{x}+\omega^2x=0$$

## Код программы на OpenModelica: 

	model laba4_2
	
	  Real x(start=0.9);
	  Real y(start=1.9);
	  parameter Real w( start=7);
	  parameter Real g( start=0.5);
	
	equation
	
	  der(x)= y;
	  der(y)= -w*x-g*y;
	  
	  annotation(experiment(StartTime=0, StopTime=56, Tolerance=1e-6, Interval=0.05));
	
	end laba4_2;

## Результаты: 

![Фазовый портрет для случая 2 на OpenModelica](image/lab04_2_2_open.png){ #fig:001 width=70% height=70% }

![График решения для случая 2 на OpenModelica](image/lab04_2_1_open.png){ #fig:002 width=70% height=70% }

![Фазовый портрет для случая 2 на Julia](image/lab04_2_2.png){ #fig:001 width=70% height=70% }

![График решения для случая 2 на Julia](image/lab04_2_1.png){ #fig:002 width=70% height=70% }

## 3. На систему действует внешняя сила.

Получаем уравнение 

$$\ddot{x}+2\gamma\dot{x}+\omega^2x=F(t)$$

## Код программы на OpenModelica: 

	model laba4_3
	
	  Real x(start=0.9);
	  Real y(start=1.9);
	  parameter Real w( start=0.5);
	  parameter Real g( start=7);
	
	equation
	
	  der(x)= y;
	  der(y)= -w*x-g*y+0.5*sin(0.7*time);
	  
	  annotation(experiment(StartTime=0, StopTime=56, Tolerance=1e-6, Interval=0.05));
	
	end laba4_3;

## Результаты: 

![Фазовый портрет для случая 3 на OpenModelica](image/lab04_3_2_open.png){ #fig:001 width=70% height=70% }

![График решения для случая 3 на OpenModelica](image/lab04_3_1_open.png){ #fig:002 width=70% height=70% }

![Фазовый портрет для случая 3 на Julia](image/lab04_3_2.png){ #fig:001 width=70% height=70% }

![График решения для случая 3 на Julia](image/lab04_3_1.png){ #fig:002 width=70% height=70% }

# Выводы

В ходе выполнения лабораторной работы были построены решения уравнений гармонического осциллятора, а также фазовые портреты для трех случаев:
1. Колебания гармонического осциллятора без затуханий и без действий внешней силы
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы

# Список литературы