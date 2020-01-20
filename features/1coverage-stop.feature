# language: ru

Функционал: Проверка работы команды stop
    Как Пользователь
    Я хочу автоматически проверять работу команды stop
    Чтобы гарантировать корректность работы команды stop

Контекст: Работа в каталоге проекта
    Допустим я установил каталог проекта "." как текущий

Сценарий: Запуск приложения с командой stop для несуществующей базы
    Когда Я создаю временный каталог и сохраняю его в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/1coverage/1coverage.os stop"
    Тогда Вывод команды "oscript" содержит "Не найден файл PID"
    И код возврата равен 1

Сценарий: Запуск приложения с командой stop для существующей файловой базы
    Когда Я создаю временный каталог и сохраняю его в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    И Я выполняю команду "runner" с параметрами "init-dev --root <РабочийКаталог> --ibconnection /F<РабочийКаталог>/build/1coverage-stop"
    И Я выполняю команду "oscript" с параметрами "./src/1coverage/1coverage.os init --ibconnection /F<РабочийКаталог>/build/1coverage-stop"
    И Я очищаю параметры команды "oscript" в контексте
    И Я установил рабочий каталог как текущий каталог
    И Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/1coverage/1coverage.os start --ibconnection /F./build/1coverage-stop"
    И Я очищаю параметры команды "oscript" в контексте
    И Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/1coverage/1coverage.os stop"
    И код возврата равен 0
    И завершен процесс с PID который указан в строке "1" файла "./build/PID"
    И завершен процесс с PID который указан в строке "2" файла "./build/PID"
    И завершен процесс с PID который указан в строке "3" файла "./build/PID"
