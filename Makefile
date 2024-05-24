include .env

test:
	@echo ${NAME} ${GH_USERNAME} ${GH_PAT}

start:
	docker start my-node-app

stop:
	docker stop my-node-app

create:
	docker run -d -p 3000:3000 --name my-node-app ghcr.io/${APP_NAME}

remove:
	docker rm my-node-app

buildOld:
	docker build -t ${APP_NAME} .

build:
	docker build -t ghcr.io/${APP_NAME} .

push:
	docker push ghcr.io/${APP_NAME}

auth:
	echo ${GH_PAT} | docker login ghcr.io -u ${GH_USERNAME} --password-stdin

login:
	docker login --username ${GH_USERNAME} --password ${GH_PAT} ghcr.io

print_hello:
	echo "Hello, world!"
