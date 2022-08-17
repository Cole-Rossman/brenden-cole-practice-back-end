-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS todos CASCADE;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL
);

CREATE TABLE todos (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT,
    description VARCHAR NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT(false),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (
    email,
    password_hash
)
VALUES
    ('testing@example.com', 'testing123');

INSERT INTO todos (
    description,
    completed,
    user_id
)
VALUES
    ('Watch Rough and Rowdy', true, '1'),
    ('Wash my dirty clothes', false, '1'),
    ('Be alone in a dive bar', true, '1');