-- init.sql
CREATE SEQUENCE public.surveys_id_seq;
CREATE SEQUENCE public.questions_id_seq;
CREATE SEQUENCE public.answer_variants_id_seq;

create table if not exists public.users
(
    id                 bigint    not null
        primary key,
    first_name         varchar   not null,
    last_name          varchar,
    language_code      varchar   not null,
    profile_picture    varchar,
    username           varchar,
    allows_write_to_pm boolean,
    creation_date      timestamp not null
);

alter table public.users
    owner to survey_bot_user;

create table if not exists public.surveys
(
    id                  varchar   not null
        primary key,
    title               varchar   not null,
    description         varchar   not null,
    creation_date       timestamp not null,
    is_active           boolean   not null,
    code_valid_end_date timestamp not null
);

alter table public.surveys
    owner to survey_bot_user;

ALTER TABLE public.surveys
    ALTER COLUMN id SET DEFAULT nextval('surveys_id_seq');

create table if not exists public.questions
(
    id             varchar not null
        primary key,
    survey_id      varchar not null
        constraint fk_survey
            references public.surveys,
    title          varchar not null,
    description    varchar not null,
    question_index integer not null
);

alter table public.questions
    owner to survey_bot_user;

ALTER TABLE public.questions
    ALTER COLUMN id SET DEFAULT nextval('questions_id_seq');

create table if not exists public.answer_variants
(
    id          varchar not null
        primary key,
    question_id varchar not null
        constraint fk_question
            references public.questions,
    label       varchar not null,
    value       varchar not null
);

alter table public.answer_variants
    owner to survey_bot_user;

ALTER TABLE public.answer_variants
    ALTER COLUMN id SET DEFAULT nextval('answer_variants_id_seq');

create table if not exists public.answers
(
    id                varchar   not null
        primary key,
    user_id           varchar   not null,
    question_id       varchar   not null
        constraint fk_question_answer
            references public.questions,
    answer_variant_id varchar   not null,
    timestamp         timestamp not null
);

alter table public.answers
    owner to survey_bot_user;

create table if not exists public.codes
(
    id        varchar not null
        primary key,
    user_id   varchar not null,
    survey_id varchar not null,
    is_used   boolean not null
);

alter table public.codes
    owner to survey_bot_user;


--- INIT DATA
INSERT INTO public.surveys (title, description, creation_date, is_active, code_valid_end_date)
VALUES ('Первый опрос',
        'Тестовый первый опрос',
        'NOW()', true, 'NOW()');


INSERT INTO public.questions( survey_id, title, description, question_index) VALUES ('1', 'Вопрос 1', ' ', 1);
INSERT INTO public.questions( survey_id, title, description, question_index) VALUES ('1', 'Вопрос 2', ' ', 2);
INSERT INTO public.questions( survey_id, title, description, question_index) VALUES ('1', 'Вопрос 3', ' ', 4);
INSERT INTO public.questions( survey_id, title, description, question_index) VALUES ('1', 'Вопрос 4', ' ', 5);
INSERT INTO public.questions( survey_id, title, description, question_index) VALUES ('1', 'Вопрос 5', ' ', 6);

INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('1', 'Ответ 1', '1');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('1', 'Ответ 2', '2');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('1', 'Ответ 3', '3');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('1', 'Ответ 4', '4');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('1', 'Ответ 5', '5');

INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('2', 'Ответ 1', '1');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('2', 'Ответ 2', '2');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('2', 'Ответ 3', '3');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('2', 'Ответ 4', '4');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('2', 'Ответ 5', '5');

INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('3', 'Ответ 1', '1');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('3', 'Ответ 2', '2');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('3', 'Ответ 3', '3');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('3', 'Ответ 4', '4');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('3', 'Ответ 5', '5');

INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('4', 'Ответ 1', '1');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('4', 'Ответ 2', '2');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('4', 'Ответ 3', '3');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('4', 'Ответ 4', '4');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('4', 'Ответ 5', '5');

INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('5', 'Ответ 1', '1');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('5', 'Ответ 2', '2');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('5', 'Ответ 3', '3');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('5', 'Ответ 4', '4');
INSERT INTO public.answer_variants ( question_id, label, value) VALUES ('5', 'Ответ 5', '5');
