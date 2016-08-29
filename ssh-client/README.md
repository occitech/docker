# Docker image for running openssh client

Minimalist image for running openssh client, usefull for continuous integration task.

## Usage

Connect to a remote server using password
```bash
docker run -it --rm occitech/ssh-client user@sever
```

Connect to a remote server using local ssh key and launch a command
```bash
docker run -it --rm -v ~/.ssh:/root/.ssh occitech/ssh-client user@sever pwd
```

Connect to a remote server into verbose mode using local ssh key and ssh agent socket
```bash
docker run -it --rm -v ~/.ssh:/root/.ssh -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent occitech/ssh-client -v user@sever
```
