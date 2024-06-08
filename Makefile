include .env

test:
	@echo ${NAME} ${GH_USERNAME} ${GH_PAT}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

create:
	docker rm -f ${CONTAINER_NAME} 2>/dev/null || true
	docker run -d -p ${PORT}:3000 --name ${CONTAINER_NAME}  --network ${NETWORK_NAME} ghcr.io/${IMAGE_NAME}

remove:
	docker rm -f ${CONTAINER_NAME}

build:
	docker build -t ghcr.io/${IMAGE_NAME} .

push:
	docker push ghcr.io/${IMAGE_NAME}

auth:
	echo ${GH_PAT} | docker login ghcr.io -u ${GH_USERNAME} --password-stdin

login:
	docker login --username ${GH_USERNAME} --password ${GH_PAT} ghcr.io

init: build create

print_hello:
	echo "Hello, world!"
