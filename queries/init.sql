CREATE TABLE IF NOT EXISTS "staff"
(
    "id"            INT PRIMARY KEY,
    "first_name"    VARCHAR(32) NOT NULL,
    "last_name"     VARCHAR(32) NOT NULL,
    "patronymic"    VARCHAR(32),
    "birth_date"    DATE NOT NULL,
    "email"         VARCHAR(320),
    "position"      VARCHAR(32) NOT NULL,
    "department"    VARCHAR(32) NOT NULL,
    "role"          VARCHAR(32) NOT NULL,
    "login"         VARCHAR(32) NOT NULL,
    "password"      VARCHAR(64)  NOT NULL,
    "registeredAt"  TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "service"
(
    "id"            INT PRIMARY KEY,
    "name"          VARCHAR(64) NOT NULL,
    "duration"      INTEGER,
    "price"         DECIMAL(6, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS "medicine"
(
    "id"                INT PRIMARY KEY,
    "name"              VARCHAR(32) NOT NULL,
    "description"       VARCHAR(256),
    "category"          VARCHAR(32) NOT NULL,
    "amount"            INT NOT NULL,
    "waranty"           INT NOT NULL
);

CREATE TABLE IF NOT EXISTS "medicine_operation"
(
    "id"                INT PRIMARY KEY,
    "medicine_id"       INT NOT NULL,
    "operation"         VARCHAR(32) NOT NULL,
    "amount"            INT NOT NULL,
    "price"             DECIMAL(6, 2) NOT NULL,
    "date_time"         TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("medicine_id") REFERENCES "medicine" ("id")
);

CREATE TABLE IF NOT EXISTS "room"
(
    "id"            INT PRIMARY KEY,
    "staff_id"      INT NOT NULL,
    "number"        INT NOT NULL,
    "max_capacity"  INT NOT NULL,
    FOREIGN KEY ("staff_id") REFERENCES "staff" ("id")
);

CREATE TABLE IF NOT EXISTS "patient"
(
    "id"            INT PRIMARY KEY,
    "room_id"       INT NOT NULL,
    "first_name"    VARCHAR(32) NOT NULL,
    "last_name"     VARCHAR(32) NOT NULL,
    "patronymic"    VARCHAR(32),
    "sex"           CHAR(1) NOT NULL,
    "birth_date"    DATE NOT NULL,
    "city"          VARCHAR(32) NOT NULL,
    "street"        VARCHAR(32) NOT NULL,
    "st_number"     INT NOT NULL,
    "flat_number"   INT,
    "phone_number"  VARCHAR(15),
    "email"         VARCHAR(320),
    "card_number"   VARCHAR(8) NOT NULL,
    "registeredAt"  TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("room_id") REFERENCES "room" ("id")
);
CREATE INDEX IF NOT EXISTS "patient_lastname_index" ON "patient" ("last_name");

CREATE TABLE IF NOT EXISTS "schedule"
(
    "id"                INT PRIMARY KEY,
    "staff_id"          INT NOT NULL,
    "patient_id"        INT NOT NULL,
    "abscent"           BOOLEAN NOT NULL,
    "date_time"         TIMESTAMP,
    FOREIGN KEY ("staff_id") REFERENCES "staff" ("id"),
    FOREIGN KEY ("patient_id") REFERENCES "patient" ("id")
);
CREATE INDEX IF NOT EXISTS "schedule_patient_index" ON "schedule" ("patient_id");
CREATE INDEX IF NOT EXISTS "schedule_staff_index" ON "schedule" ("staff_id");

CREATE TABLE IF NOT EXISTS "examination"
(
    "id"                INT PRIMARY KEY,
    "schedule_id"       INT NOT NULL,
    "type"              VARCHAR(32) NOT NULL,
    "disease"           VARCHAR(128),
    "result"            TEXT,
    FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("id")
);
CREATE INDEX IF NOT EXISTS "examination_schedule_index" ON "examination" ("schedule_id");

CREATE TABLE IF NOT EXISTS "purchase"
(
    "id"                INT PRIMARY KEY,
    "service_id"        INT NOT NULL,
    "patient_id"        INT NOT NULL,
    "total"             DECIMAL(6, 2) NOT NULL,
    "paid"              BOOLEAN NOT NULL,
    "date_time"         TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("service_id") REFERENCES "service" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("patient_id") REFERENCES "patient" ("id")
);

CREATE TABLE IF NOT EXISTS "prescription"
(
    "id"                INT PRIMARY KEY,
    "examination_id"    INT NOT NULL,
    "medicine_id"       INT NOT NULL,
    "notes"             VARCHAR(256),
    FOREIGN KEY ("examination_id") REFERENCES "examination" ("id"),
    FOREIGN KEY ("medicine_id") REFERENCES "medicine" ("id")
);
CREATE INDEX IF NOT EXISTS "prescription_exam_index" ON "prescription" ("examination_id");
CREATE INDEX IF NOT EXISTS "prescription_medicine_index" ON "prescription" ("medicine_id");

CREATE TABLE IF NOT EXISTS "provided_service"
(
    "id"                INT PRIMARY KEY,
    "service_id"        INT NOT NULL,
    "schedule_id"       INT NOT NULL,
    "providedAt"        TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("service_id") REFERENCES "service" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("id")
);
