
DROP TABLE IF EXISTS P_C;
DROP TABLE IF EXISTS CRASH;
DROP TABLE IF EXISTS DAMAGE;
DROP TABLE IF EXISTS PERSON;
DROP TABLE IF EXISTS CAR;

CREATE TABLE "PERSON" (
    "PERSON_ID" VARCHAR   NOT NULL,
    "PERSON_TYPE" TEXT,
    "PERSON_AGE" INT,
	"PERSON_SEX" TEXT,
    CONSTRAINT "pk_PERSON" PRIMARY KEY (
        "PERSON_ID"
     )
);

CREATE TABLE "CRASH" (
    "COLLISON_ID" INT   NOT NULL,
    "CRASH_DATE" DATE,
    "CRASH_TIME" TIME,
    "EJECTION" TEXT,
    CONSTRAINT "pk_CRASH" PRIMARY KEY (
        "COLLISON_ID"
     )
);

CREATE TABLE "P_C" (
    "PERSON_ID" VARCHAR   NOT NULL,
    "COLLISON_ID" INT   NOT NULL,
    "PERSON_INJURY" TEXT,
    "EMOTIONAL_STATUS" TEXT,
    "BODILY_INJURY" TEXT,
    "POSITION_IN_VEHICLE" TEXT,
    CONSTRAINT "pk_P_C" PRIMARY KEY (
        "PERSON_ID"
     )
);

CREATE TABLE "CAR" (
    "COLLISON_ID" INT   NOT NULL,
    "VEHICLE_ID" VARCHAR   NOT NULL,
    "STATE_REGISTRATION" TEXT,
    "VEHICLE_TYPE" TEXT,
    "VEHICLE_MAKE" TEXT,
    "VEHICLE_MODEL" TEXT,
    "VEHICLE_YEAR" INT,
    CONSTRAINT "pk_CAR" PRIMARY KEY (
        "VEHICLE_ID"
     )
);

CREATE TABLE "DAMAGE" (
    "VEHICLE_ID" VARCHAR   NOT NULL,
    "POINT_OF_IMPACT" TEXT,
    "VEHICLE_DAMAGE" TEXT,
    "VEHICLE_DAMAGE_1" TEXT,
    "VEHICLE_DAMAGE_2" TEXT,
    "VEHICLE_DAMAGE_3" TEXT,
    "PUBLIC_PROPERTY_DAMAGE" TEXT,
    "PUBLIC_PROPERTY_DAMAGE_TYPE" TEXT,
    CONSTRAINT "pk_DAMAGE" PRIMARY KEY (
        "VEHICLE_ID"
     )
);

ALTER TABLE "PERSON" ADD CONSTRAINT "fk_PERSON_PERSON_ID" FOREIGN KEY("PERSON_ID")
REFERENCES "P_C" ("PERSON_ID");

ALTER TABLE "P_C" ADD CONSTRAINT "fk_P_C_COLLISON_ID" FOREIGN KEY("COLLISON_ID")
REFERENCES "CRASH" ("COLLISON_ID");

ALTER TABLE "CAR" ADD CONSTRAINT "fk_CAR_COLLISON_ID" FOREIGN KEY("COLLISON_ID")
REFERENCES "CRASH" ("COLLISON_ID");

ALTER TABLE "CAR" ADD CONSTRAINT "fk_CAR_VEHICLE_ID" FOREIGN KEY("VEHICLE_ID")
REFERENCES "DAMAGE" ("VEHICLE_ID");

