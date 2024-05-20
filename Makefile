include .env

hello:
	@echo ${NAME}

start:
	docker start my-node-app

stop:
	docker stop my-node-app

create:
	docker run -d -p 3000:3000 --name my-node-app node-app

remove:
	docker rm my-node-app

build:
	docker build -t ${APP_NAME} .


buildgh:
	docker build -t ghcr.io/${APP_NAME} .

push:
	docker push ghcr.io/${APP_NAME}

auth:
	echo ${GH_PAT} | docker login ghcr.io -u ${GH_USERNAME} --password-stdin

login:
	docker login --username ${GH_USERNAME} --password ${GH_PAT} ghcr.io

print_hello:
	echo "Hello, world!"
