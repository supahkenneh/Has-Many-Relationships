SELECT * FROM users;

SELECT * FROM posts WHERE users_id = 100;

SELECT *, users.first_name, users.last_name
FROM posts JOIN users ON posts.users_id = users.users_id
WHERE users.users_id = 200;

SELECT username, last_name, posts.*
FROM users JOIN posts ON posts.users_id = users.users_id
WHERE first_name = 'Norene' AND last_name = 'Schmitt';

SELECT username
FROM users JOIN posts ON (posts.users_id = users.users_id)
WHERE posts.post_created_at > '2015-01-01 00:00:00-10';

SELECT post_title, post_content, users.username
FROM posts JOIN users ON (posts.users_id = users.users_id)
WHERE users.user_created_at < '2015-01-01 00:00:00-10';

SELECT posts.post_title AS "Post Title", * 
FROM comments JOIN posts ON (comments.post_id = posts.post_id);

SELECT posts.post_title AS "post_title", posts.post_url AS "post_url", comments.comment_body AS "comment_body", *
FROM comments JOIN posts ON (comments.post_id = posts.post_id)
WHERE posts.post_created_at < '2015-01-01 00:00:00-10';

SELECT posts.post_title AS "post_title", posts.post_url AS "post_url", comments.comment_body AS "comment_body", *
FROM comments JOIN posts ON (comments.post_id = posts.post_id)
WHERE posts.post_created_at > '2015-01-01 00:00:00-10';

SELECT posts.post_title AS "post_title", posts.post_url AS "post_url", comments.comment_body AS "comment_body", *
FROM comments JOIN posts ON (comments.post_id = posts.post_id)
WHERE comments.comment_body LIKE '%USB%';

SELECT posts.post_title AS "post_title", users.first_name, users.last_name, comments.comment_body AS "comment_body"
FROM comments JOIN users ON (comments.users_id = users.users_id) JOIN posts ON (comments.post_id = posts.post_id)
WHERE comments.comment_body LIKE '%matrix%';

SELECT users.first_name, users.last_name, comment_body AS "comment_body"
FROM comments JOIN users ON (comments.users_id = users.users_id) JOIN posts ON (comments.post_id = posts.post_id)
WHERE comment_body LIKE '%SSL%' AND posts.post_content LIKE '%dolorum%';

SELECT users.first_name AS "post_author_first_name", users.last_name AS "post_author_last_name", posts.post_title AS "post_title", users.username AS "comment_author_username", comment_body AS "comment_body"
FROM comments JOIN users ON (comments.users_id = users.users_id) JOIN posts ON (comments.post_id = posts.post_id)
WHERE (comment_body LIKE '%SSL%' OR comment_body LIKE '%firewall%') AND posts.post_content LIKE '%nemo%';