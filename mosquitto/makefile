CONTAINER_NAME=mosquitto-broker
SERVICE_NAME=mosquitto
PASSWORD_FILE_PATH=/mosquitto/config/pwfile.txt

UNAME_S := $(shell uname -s)
WINPTY := $(if $(findstring Linux,$(UNAME_S)),,winpty) # winpty is only added when the OS is not Linux
SUDO := $(if $(findstring Linux,$(UNAME_S)),sudo) # winpty is only added when the OS is not Linux

define exec_in_container
	$(WINPTY) $(SUDO) docker exec -it $(CONTAINER_NAME) sh -c "\
		chmod 0700 $(PASSWORD_FILE_PATH) && \
		chown root:root $(PASSWORD_FILE_PATH) && \
		mosquitto_passwd -b $(PASSWORD_FILE_PATH) $(1) $(2) && \
		exit"
endef

deploy-creating-admin-user:
	$(SUDO) docker compose up -d
	$(call exec_in_container,admin,$(admin_pass))
	$(SUDO) docker compose restart $(SERVICE_NAME)

add-user:
	$(call exec_in_container,$(new_user),$(new_password))
	$(SUDO) docker compose restart $(SERVICE_NAME)


#Docker on Git Bash (especially on Windows) requires winpty to handle interactive commands properly with the -it flags (interactive terminal). 
mqtt-subscribe:
	$(WINPTY)$(SUDO) docker exec -it $(CONTAINER_NAME) mosquitto_sub -v -t $(topic) -u $(user) -P $(password)
# For example: make mqtt-subscribe topic="test/topic" user="admin" password="1234"

mqtt-publish:
	$(WINPTY)$(SUDO) docker exec -it $(CONTAINER_NAME) mosquitto_pub -t $(topic) -m $(msg) -u $(user) -P $(password)
