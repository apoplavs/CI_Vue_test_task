# ci_test_env
ci_test_env



Приветствую

https://github.com/futureisrise/ci_test_env 


Тут находиться ядро и полный пример класса 
И собственно site.com/tests/get_last_news 

Чтобы запустить над залить бы дамп Mysql и прописать конфиг, 
и может какие то мелочи могут не работать ( починю после фидбека что сломано) 
Возможно путь к папкам ( system , application ) не верный, его надо поправить 

public/index.php : Изменить

application folder path
system folder path



-----------------------------------------------------------------------------------------

Техническое задание (backend)
Задание должно быть выполнено с использованием: (PHP 7.0 MySQL)

Приветствуется:
Vue.js

-----------------------------------------------------------------------------------------

Главная страница : 
Добавить тестовых записей в базу.
Вывести 3 последние новости, не больше трех. (картинка, заголовок, дата публикации, сокращенный текст новости до 300 символов)

ОСНОВНАЯ ЗАДАЧА !!Реализовать!!: Лайки и Комментарии;

По ПРИМЕРУ, как сделаны новости (контроллер, модель, база данных), ждем реализацию лайков,и комментариев и их функционала.

Функционал лайков и комментариев :

Поставить лайк и отменить

Написать комментарий и удалить

Лайкнуть комментарий и отменить


____________
Результат: проверить чтобы можно было работоспособность через CLI / WEB запрос. 
____________

===== Дополнительная задача( будет большим плюсом ) ======

Страница одной новости: 

Блок с данной новостью (картинка, заголовок, дата публикации, текст новости)

Статистика данной новости (количество просмотров, лайков, комментариев)

Блок с комментариями (текст комментария, лайки комментария)

Блок с популярными новостями (больше всего лайков и просмотров) (2-3 новости)

Оформление всех страниц может быть произвольным (только для визуализации результата).

Можно создавать view файлы и через контроллер выводить данные с минимальной версткой, или же как JSON API ответ 

-----------------

Приветствуется грамотное построение связей таблиц базы данных, полное использование ООП и правильное построение зависимостей между классами.


