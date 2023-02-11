<center> **РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ** </center> 

<center> **Факультет Физико-Математических Наук** </center>

<center> **Кафедра прикладной информатики и теории вероятностей** </center>

<br>  
<br>
<br>
<br>  
<br>
<br>

<center> **ОТЧЁТ** </center>

<center> **ПО ЛАБОРАТОРНОЙ РАБОТЕ № 1** </center>

<center> *дисциплина: Математическое Моделирование* </center>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<u> Студент: Евдокимов Иван Андреевич </u>

Группа: НФИбд-01-20

<u> Преподаватель: Кулябов Дмитрий Сергеевич </u>

<center> **МОСКВА** </center>
<center> 20<u>22</u>-20<u>23</u> г. </center>

<div style="page-break-before:always;">  </div>
<br>

---

**Техническое оснащение:**

+ Персональный компьютер с операционной системой Windows 10;
+ OBS Studio, использующийся для записи скринкаста лабораторной работы;
+ Приложение Visual Studio Code для редактирования файлов формата *md* , а также для конвертации файлов отчётов и презентаций;


 

**Цель работы:** Создать каталоги для работы на основе документа Рабочее пространство для лабораторной работы.




<center>**Этапы работы:**</center>


1)Выполняю следующие команды в MINGW64, чтобы git узнал моё имя и
электронную почту. 

git config --global user.name "IvEnLO"

git config --global user.email "i.evdokimov111@gmail.com"

![ №1.1.1](./ner.png)

![ №1.1.2](./1.1.2.png)

2)Настраиваю гит в MINGW64:
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --global core.quotepath off

![ №1.2.1](./1.2.1.png)

2+)Устанавливаю github CLI:
https://cli.github.com/

![ №1.2.2](./1.2.2.png)

2++)Регестрируюсь через windows консоль через команды

![ №1.2.3](./1.2.3.png)

3)Создаю рабочее пространство:

mkdir -p ~/work/study/2022-2023/"Математическое-моделирование"

cd ~/work/study/2022-2023/"Математическое-моделирование"

gh repo create study_2022-2023_mathmod --template=yamadharma/course-directory-student-template --public

git clone --recursive git@github.com:IvEnLO/study_2022-2023_mathmod.git mathmod


![ №1.3.1](./1.3.1.png)

![ №1.3.2](./1.3.2.png)

![№1.3.3](./1.3.3.png)

![№1.3.4](./1.3.4.png)

4)Запускаю git командой в MINGW64:
git init


![№1.4.1](./1.4.1.png)

5)Захожу в папку проекта:
cd study_2022-2023_mathmod

![ №1.5.1](./1.5.1.png)

6)Работа с make:
make help
make list

![ №1.6.1](./1.6.1.png)

7)Удаление лишний файл:
rm package.json

![ №1.7.1](./1.7.1.png)

8)Добавляю в курс и проверка:
echo mathmod > COURSE
make

![ №1.8.1](./1.8.1.png)

9)Добавляю на git:
git add .

![ №1.9.1](./1.9.1.png)

10)Делаю коммит:
git commit -am "feat(main): make course structure"

![ №1.10.1](./1.10.1.png)

![ №1.10.2](./1.10.2.png)

11)Заливаем на github:
git push -u origin master

![ №1.11.1](./1.11.1.png)

Итог:

![ №1.12.1](./1.12.1.png)

**Выводы:** Удалось создать каталоги для работы на основе документа Рабочее пространство для лабораторной работы.
