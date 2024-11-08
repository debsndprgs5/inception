# Docker-compose directory's path
COMPOSE_PATH = /home/zfavere/inception/project/srcs

build:
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml build

# Additional targets
up:
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml up -d

down:
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down

restart:
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml up -d

# Remove all containers, images, and volumes
clean:
	docker-compose -f $(COMPOSE_PATH)/docker-compose.yml down --rmi all --volumes --remove-orphans
