# language: ru

Функционал: Проверка работы команды convert
    Как Пользователь
    Я хочу автоматически проверять работу команды convert
    Чтобы гарантировать корректность работы приложения

Сценарий: Запуск приложения с командой convert без параметров
    Когда Я выполняю команду "oscript ./src/1coverage/1coverage.os convert"
    И код возврата равен 0
