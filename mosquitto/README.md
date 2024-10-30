# Mosquitto-docker

**WARNING!** Directly adding a new user by manually writing `{user}:{password}` in `pwfile.txt` might cause issues. The `pwfile.txt` file may not have the correct write permissions, and the password needs to be properly encoded. It is recommended to use the Makefile commands to create a user to avoid these problems.