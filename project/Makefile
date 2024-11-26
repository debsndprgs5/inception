# Docker-compose directory's path
include ./srcs/.env
export

build:
	@echo "Creating $(DOMAIN_NAME) in etc/hosts..."
	@sudo chmod 666 $(HOSTS)
	@sudo echo "127.0.0.1 $(DOMAIN_NAME)" >> $(HOSTS)
	@sudo echo "127.0.0.1 www.$(DOMAIN_NAME)" >> $(HOSTS)
	@echo "Creating & starting containers..."
	@mkdir -p $(ABSOLUTE_PATH)$(DB_VOLUME_PATH) $(ABSOLUTE_PATH)$(WP_VOLUME_PATH)
	@chmod 777 $(ABSOLUTE_PATH)$(DB_VOLUME_PATH) $(ABSOLUTE_PATH)$(WP_VOLUME_PATH)
	@docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml up --build -d

# Additional targets

down:
	@sudo docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml down

restart:
	@sudo docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml down
	@sudo docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml up -d

# Remove all containers, images, and volumes
clean:
	@echo "Turning off the containers..."
	@cd srcs && docker-compose down

#Remove all Docker networks/volumes that currently exist on the system, 
#without showing errors if there are none to delete
fclean:
	@make clean
	@echo "Removing every container, image and volume..."
	@docker system prune -a -f --volumes
	@docker network prune -f
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null || true
	@rm -rf $(ABSOLUTE_PATH)$(DB_VOLUME_PATH) $(ABSOLUTE_PATH)$(WP_VOLUME_PATH)

re:
	make fclean
	make build

