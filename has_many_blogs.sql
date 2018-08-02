DROP USER IF EXISTS has_many_user;
DROP DATABASE IF EXISTS has_many_blogs;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users (
  users_id          serial                    NOT NULL  PRIMARY KEY,
  username          varchar(90)               NOT NULL,
  first_name        varchar(90)               NULL      DEFAULT NULL,
  last_name         varchar(90)               NULL      DEFAULT NULL,
  user_created_at   timestamp with time zone  NOT NULL  DEFAULT now(),
  user_updated_at   timestamp with time zone  NOT NULL  DEFAULT now()
);

CREATE TABLE posts (
  post_id            serial                    NOT NULL  PRIMARY KEY,
  post_title         varchar(180)              NULL      DEFAULT NULL,
  post_url           varchar(510)              NULL      DEFAULT NULL,
  post_content       text                      NULL      DEFAULT NULL,
  post_created_at    timestamp with time zone  NOT NULL  DEFAULT now(),
  post_updated_at    timestamp with time zone  NOT NULL  DEFAULT now(),
  users_id           integer                   NOT NULL  REFERENCES users (users_id)
);

CREATE TABLE comments (
  comment_id       serial                    NOT NULL  PRIMARY KEY,
  comment_body     varchar(510)              NULL      DEFAULT NULL,
  comm_created_at  timestamp with time zone  NOT NULL  DEFAULT now(),
  comm_updated_at  timestamp with time zone  NOT NULL  DEFAULT now(),
  users_id         integer                   NOT NULL  REFERENCES users (users_id),
  post_id          integer                   NOT NULL  REFERENCES posts (post_id)
);

