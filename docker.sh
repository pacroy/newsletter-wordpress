docker network create wordpress

docker run -d --net wordpress  \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_PASSWORD=secret \
 --name="wordpress-mysql" \
 mysql:5.7

docker run -d --net wordpress \
-e WORDPRESS_DB_HOST=wordpress-mysql \
-e WORDPRESS_DB_USER=wordpress \
-e WORDPRESS_DB_PASSWORD=secret \
-e WORDPRESS_DB_NAME=wordpress \
 --name="wordpress" \
 -p 8080:80 \
 wordpress

docker run -d --net wordpress \
 --name="wordpress-smtp" \
 namshi/smtp