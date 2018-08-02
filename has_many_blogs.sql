DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  users_id          serial                    NOT NULL  PRIMARY KEY,
  username          varchar(90)               NOT NULL,
  first_name        varchar(90)                         DEFAULT NULL,
  last_name         varchar(90)                         DEFAULT NULL,
  user_created_at   timestamp with time zone  NOT NULL  DEFAULT now(),
  user_updated_at   timestamp with time zone  NOT NULL  DEFAULT now()
);

CREATE TABLE posts (
  post_id            serial                    NOT NULL  PRIMARY KEY,
  post_title         varchar(180)                        DEFAULT NULL,
  post_url           varchar(510)                        DEFAULT NULL,
  post_content       text                                DEFAULT NULL,
  post_created_at    timestamp with time zone  NOT NULL  DEFAULT now(),
  post_updated_at    timestamp with time zone  NOT NULL  DEFAULT now(),
  users_id           integer                   NOT NULL  REFERENCES users (users_id)
);

CREATE TABLE comments (
  comment_id       serial                    NOT NULL  PRIMARY KEY,
  comment_body     varchar(510)                        DEFAULT NULL,
  comm_created_at  timestamp with time zone  NOT NULL  DEFAULT now(),
  comm_updated_at  timestamp with time zone  NOT NULL  DEFAULT now(),
  post_id          integer                   NOT NULL  REFERENCES posts (post_id),
  users_id         integer                   NOT NULL  REFERENCES users (users_id)
);

CREATE INDEX ON users (users_id);
CREATE INDEX ON posts (post_id);
CREATE INDEX ON comments (comment_id);