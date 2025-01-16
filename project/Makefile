build:
	@mkdir -p $(ABSOLUTE_PATH)$(DB_VOLUME_PATH) $(ABSOLUTE_PATH)$(WP_VOLUME_PATH)
	@chmod 777 $(ABSOLUTE_PATH)$(DB_VOLUME_PATH) $(ABSOLUTE_PATH)$(WP_VOLUME_PATH)
	@sudo echo "127.0.0.1 $(DOMAIN_NAME)" >> $(HOSTS)
	@sudo echo "127.0.0.1 www.$(DOMAIN_NAME)" >> $(HOSTS)
	@docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml up build
up: build
	@docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml up -d
down:
	@docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml down
prune:
	docker system prune -a -f
fclean:
	docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml down && docker system prune -a -f
logs:
	docker-compose -f $(ABSOLUTE_PATH)/docker-compose.yml logs -f -t
help:
	@printf "build:\tbuild inception\nup:\tlaunch docker\ndown:\tstop docker and rm\nprune:\trm all dockers\nfclean:\tdown & prune\nlogs:\tself explanatory\n"
