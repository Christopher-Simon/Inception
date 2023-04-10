#mettre le mkdir de /home/chsimon/data/wordpress et 
#/home/chsimon/data/mariadb

all:
	mkdir -p /home/chsimon/data/wordpress
	mkdir -p /home/chsimon/data/mariadb
	sudo chmod 777 /home/chsimon/data/wordpress
	sudo chmod 777 /home/chsimon/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

build:
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker compose -f ./srcs/docker-compose.yml stop

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -af
	docker volume prune -f

fclean : clean
	sudo rm -rf /home/chsimon/data/wordpress
	sudo rm -rf /home/chsimon/data/mariadb

re: fclean all

log :
	docker compose -f srcs/docker-compose.yml logs

