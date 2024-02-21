CREATE TABLE
    CLIENTS (
        id INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
        DOC_NUMBER VARCHAR(255),
        EMAIL VARCHAR(255),
        LAST_NAME VARCHAR(255),
        NAME VARCHAR(100),
        CONSTRAINT "CONSTRAINT_1" PRIMARY KEY (id)
    );

CREATE TABLE
    PRODUCTS (
        id INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
        BAR_CODE VARCHAR(255),
        DESCRIPTION VARCHAR(255),
        INVENTORY VARCHAR(255),
        NAME VARCHAR(100),
        PRICE DOUBLE PRECISION,
        CONSTRAINT "CONSTRAINT_2" PRIMARY KEY (id)
    );

CREATE TABLE
    ITEMS (
        id INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
        PRICE DOUBLE PRECISION,
        QUANTITY INT,
        PRODUCT_ID INT,
        TRANSACCION_ID INT,
        CONSTRAINT "CONSTRAINT_3" PRIMARY KEY (id)
    );

CREATE TABLE
    TRANSACTIONS (
        id INT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
        APPROVED BOOLEAN,
        DATE TIMESTAMP,
        TOTAL DOUBLE PRECISION,
        CLIENT_ID INT,
        CONSTRAINT "CONSTRAINT_4" PRIMARY KEY (id)
    );

ALTER TABLE CLIENTS ADD CONSTRAINT UK_srv16ica2c1csub334bxjjb59 UNIQUE (EMAIL);

ALTER TABLE PRODUCTS ADD CONSTRAINT UK_ks7bl2r407pphq72vxpufxqn UNIQUE (BAR_CODE);

ALTER TABLE ITEMS ADD CONSTRAINT FKmtk37pxnx7d5ck7fkq2xcna4i FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (id);

ALTER TABLE ITEMS ADD CONSTRAINT FKl5n4q0ipc14o7tld64221gm7h FOREIGN KEY (TRANSACCION_ID) REFERENCES TRANSACTIONS (id);

ALTER TABLE TRANSACTIONS ADD CONSTRAINT FKjp6w7dmqrj0h9vykk2pbtik2 FOREIGN KEY (CLIENT_ID) REFERENCES CLIENTS (id);