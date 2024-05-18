create table "user"
(id bigint primary key ,
 name varchar,
 lastname varchar);

insert into "user" values (1,'Иван', 'Иванов');
insert into "user" values (2,'Петр', null);
insert into "user" values (3, null, 'Сидоров');

create table currency(
    id bigint not null ,
    name varchar not null ,
    rate_to_usd numeric,
    updated timestamp
);

insert into currency values (100, 'EUR', 0.9, '2022-03-03 13:31');
insert into currency values (100, 'EUR', 0.89, '2022-03-02 12:31');
insert into currency values (200, 'USD', 1, '2022-03-03 13:31');
insert into currency values (300, 'JPY', 0.0079, '2022-03-01 13:31');

create table balance
(user_id bigint,
 money numeric,
 type integer,
 currency_id integer,
 updated timestamp);

insert into balance values (4, 120,1, 200, '2022-01-01 01:31');
insert into balance values (1, 190,1, 100, '2022-01-10 13:31');
insert into balance values (2, 100,2, 210, '2022-01-09 13:31');
insert into balance values (3, 500,1, 200, '2022-01-09 13:31');
insert into balance values (3, 500,2, 300, '2022-01-09 13:31');

insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
insert into currency values (100, 'EUR', 0.87, '2022-03-02 08:00');
insert into currency values (100, 'EUR', 0.9, '2022-03-01 15:36');
insert into currency values (200, 'USD', 1, '2022-03-02 12:31');
insert into currency values (300, 'JPY', 0.0087, '2022-03-03 13:31');
insert into balance values (4, 120,0, 300, '2022-01-01 01:31');
insert into balance values (1, 20,1, 100, '2022-01-01 13:31');
insert into balance values (1, 200,1, 100, '2022-01-09 13:31');
insert into balance values (2, 103,2, 210, '2022-01-10 13:31');
insert into balance values (3, 50,0, 100, '2022-01-09 13:31');

CREATE TABLE current_balance (
    user_id BIGINT,
    currency_id INTEGER,
    current_money_in_usd NUMERIC,
    updated TIMESTAMP,
    PRIMARY KEY (user_id, currency_id)
);

ALTER TABLE balance ADD COLUMN id BIGSERIAL PRIMARY KEY;
ALTER TABLE currency ADD COLUMN id BIGSERIAL PRIMARY KEY;

