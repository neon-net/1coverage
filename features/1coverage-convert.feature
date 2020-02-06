# language: ru

Функционал: Проверка работы команды convert
    Как Пользователь
    Я хочу автоматически проверять работу команды convert
    Чтобы гарантировать корректность работы приложения

Контекст: Работа в каталоге проекта
    Допустим я установил каталог проекта "." как текущий
    И Я очищаю параметры команды "oscript" в контексте

Сценарий: Запуск приложения с командой convert без параметров
    Когда Я выполняю команду "oscript" с параметрами "./src/1coverage/1coverage.os convert"
    И Я сообщаю вывод команды "oscript"
    И код возврата равен 1

Сценарий: Запуск приложения с командой convert, исходники EDT, формат результата GenericCoverage
    Когда Я создаю временный каталог и сохраняю его в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    И Я копирую каталог "dbgs-log" из каталога "tests/fixtures" проекта в рабочий каталог
    И Я копирую каталог "сf-edt" из каталога "tests/fixtures" проекта в рабочий каталог
    И Я установил рабочий каталог как текущий каталог
    И Я добавляю параметр "<КаталогПроекта>/src/1coverage/1coverage.os convert" для команды "oscript"
    И Я добавляю параметр "--log-path ./build/dbgs-log" для команды "oscript"
    И Я добавляю параметр "--src-path ./cf-edt" для команды "oscript"
    И Я добавляю параметр "--out ./build/GenericCoverage.json" для команды "oscript"
    И Я добавляю параметр "--format GenericCoverage" для команды "oscript"
    И Я выполняю команду "oscript"
    И Я сообщаю вывод команды "oscript"
    И Вывод команды "oscript" не содержит "КРИТИЧНАЯОШИБКА"
    И код возврата равен 0
    И файл "./build/GenericCoverage.json" существует
    И файл "./build/GenericCoverage.json" содержит
    """
    <coverage version="1">
    <file path="tests\fixtures\cf-edt\Documents\Документ1\Commands\Команда1\CommandModule.bsl">
        <lineToCover lineNumber="5" covered="true"/>
        <lineToCover lineNumber="7" covered="true"/>
    </file>
    <file path="tests\fixtures\cf-edt\Configuration\SessionModule.bsl">
        <lineToCover lineNumber="4" covered="true"/>
        <lineToCover lineNumber="6" covered="true"/>
    </file>
    <file path="tests\fixtures\cf-edt\CommonCommands\ОбщаяКоманда1\CommandModule.bsl">
        <lineToCover lineNumber="5" covered="true"/>
        <lineToCover lineNumber="7" covered="true"/>
    </file>
    </coverage>
    """

Сценарий: Запуск приложения с командой convert, исходники XML, формат результата GenericCoverage

Сценарий: Запуск приложения с командой convert, исходники EDT, формат результата lcov

Сценарий: Запуск приложения с командой convert, исходники XML, формат результата lcov
