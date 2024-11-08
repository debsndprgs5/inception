# Docker-compose directory's path
COMPOSE_PATH = /home/zfavere/inception/project/srcs

build:
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml build

# Additional targets
up:
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml up -d

down:
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down

restart:
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml up -d

# Remove all containers, images, and volumes
clean:
	sudo docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down --rmi all --volumes --remove-orphans
