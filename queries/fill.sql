INSERT INTO "staff"
VALUES (1, 'Ирина', 'Павловна', 'Крюкова', '1971-01-01',
            'irina1971@tut.by', 'Врач-медсестра', 'Аллергологическое', 'user', 'username1', 'password1'),
       (2, 'Юрий', 'Юрьевич', 'Зверев', '1964-02-02',
            'uzverev@gmail.com', 'Хирург', 'Хирургический корпус', 'user', 'username2', 'password2'),
       (3, 'Алексей', 'Андреевич', 'Адрианов', '1980-03-03',
            'alexadmin@gmail.com', 'Главрач', 'Поликлиника', 'admin', 'username3', 'password3');

INSERT INTO "service"
VALUES (1, 'Ультратонотерапия', 20, '9.99'),
       (2, 'Консультация физиотерапевта', 15, '14.99'),
       (3, 'Электрофорез', 20, '12.99'),
       (4, 'Подбор индивидуальной диеты', NULL, '19.99');


INSERT INTO "medicine"
VALUES (1, 'Абомин', 'Abominum', 'Антибиотики', 10, 12),
        (2, 'Авастин', 'Avastin', 'Антибиотики', 2, 24),
        (3, 'Ромашка', '', 'Травы', 30, 6);

INSERT INTO "medicine_operation"
VALUES (1, 1, 'Продажа', 1, '24.99', CURRENT_TIMESTAMP),
        (2, 3, 'Покупка', 30, '179.99', CURRENT_TIMESTAMP);

INSERT INTO "room"
VALUES (1, 1, 801, 6),
        (2, 1, 802, 2);

INSERT INTO "patient"
VALUES (1, 1, 'Алексей', 'Масликов', 'Игоревич', 'М', '1990-04-04', 'Бобруйск',
            'Карла Маркса', '15', NULL, '+375291111111', 'alexmaslikov@gmail.com', '11111111'),
        (2, 2, 'Анастасия', 'Умова', 'Сергеевна', 'Ж', '1995-05-05', 'Минск',
            'Николы Теслы', '20', '74', '+375442222222', NULL, '22222222'),
        (3, 2, 'Григорий', 'Малый', NULL, 'М', '1969-06-06', 'Минск',
            'Кирова', '31', '1', '+375173333333', 'mgrigoriy@yandex.ru', '3333333');

INSERT INTO "schedule"
VALUES (1, 3, 1, FALSE, CURRENT_TIMESTAMP),
        (2, 2, 1, TRUE, CURRENT_TIMESTAMP),
        (3, 2, 2, FALSE, CURRENT_TIMESTAMP),
        (4, 1, 3, FALSE, CURRENT_TIMESTAMP);

INSERT INTO "examination"
VALUES (1, 1, 'Консультация', 'Ревматоидный артрит', 'Направить в ревматологическое отделение'),
        (2, 3, 'Консультация', NULL, 'Ок');

INSERT INTO "purchase"
VALUES (1, 1, 1, '19.98', TRUE),
        (2, 4, 2, '19.99', FALSE);

INSERT INTO "prescription"
VALUES (1, 1, 1, 'Принимать по две таблтеки в день в течение 7 дней'),
        (2, 1, 3, 'Пить по чашке в день в течение 14 дней');

INSERT INTO "provided_service"
VALUES (1, 4, 3);

