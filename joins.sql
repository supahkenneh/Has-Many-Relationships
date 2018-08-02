--1
SELECT * FROM users;

--2
SELECT * FROM posts WHERE users_id = 100;

--3
SELECT 
  p.*, 
  users.first_name, 
  users.last_name
FROM posts AS p JOIN users ON p.users_id = users.users_id
WHERE users.users_id = 200;

--4
SELECT 
  username, 
  last_name, 
  posts.*
FROM users JOIN posts ON posts.users_id = users.users_id
WHERE first_name = 'Norene' AND last_name = 'Schmitt';

--5
SELECT username
FROM users 
JOIN posts ON (posts.users_id = users.users_id)
WHERE posts.post_created_at > '2015-01-01 00:00:00-10';

--6
SELECT 
  post_title, 
  post_content, 
  users.username
FROM posts 
JOIN users ON (posts.users_id = users.users_id)
WHERE users.user_created_at < '2015-01-01 00:00:00-10';

--7
SELECT 
  posts.post_title AS "Post Title",
  c.* 
FROM comments AS c
JOIN posts ON (c.post_id = posts.post_id);

--8
SELECT 
  posts.post_title AS "post_title", 
  posts.post_url AS "post_url", 
  c.comment_body AS "comment_body", 
  c.*
FROM comments AS c
JOIN posts ON (c.post_id = posts.post_id)
WHERE posts.post_created_at < '2015-01-01 00:00:00-10';

--9
SELECT 
  posts.post_title AS "post_title", 
  posts.post_url AS "post_url", 
  c.comment_body AS "comment_body", 
  *
FROM comments AS c
JOIN posts ON (c.post_id = posts.post_id)
WHERE posts.post_created_at > '2015-01-01 00:00:00-10';

--10
SELECT 
  posts.post_title AS "post_title", 
  posts.post_url AS "post_url", 
  c.comment_body AS "comment_body", 
  c.*
FROM comments AS c
JOIN posts ON (c.post_id = posts.post_id)
WHERE c.comment_body LIKE '%USB%';

--11
SELECT 
  posts.post_title AS "post_title", 
  users.first_name, 
  users.last_name, 
  comments.comment_body AS "comment_body"
FROM comments 
JOIN users ON (comments.users_id = users.users_id) 
JOIN posts ON (comments.post_id = posts.post_id)
WHERE comments.comment_body LIKE '%matrix%';

--12
SELECT 
  users.first_name, 
  users.last_name, 
  comment_body AS "comment_body"
FROM comments 
JOIN users ON (comments.users_id = users.users_id) 
JOIN posts ON (comments.post_id = posts.post_id)
WHERE comment_body LIKE '%SSL%' AND posts.post_content LIKE '%dolorum%';

--13
SELECT 
  users.first_name AS "post_author_first_name", 
  users.last_name AS "post_author_last_name", 
  posts.post_title AS "post_title", 
  users.username AS "comment_author_username", 
  comment_body AS "comment_body"
FROM comments 
JOIN users ON (comments.users_id = users.users_id) 
JOIN posts ON (comments.post_id = posts.post_id)
WHERE (
  comment_body LIKE '%SSL%' 
  OR comment_body LIKE '%firewall%'
) 
AND posts.post_content LIKE '%nemo%';

--14
SELECT COUNT(*)
FROM comments JOIN posts ON (comments.post_id = posts.post_id)
WHERE posts.post_created_at > '2015-07-14 00:00:00-10';

--15
SELECT COUNT(*)
FROM users JOIN comments ON (comments.users_id = users.users_id)
WHERE comments.comment_body LIKE '%programming%';