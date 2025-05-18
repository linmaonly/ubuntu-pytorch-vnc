.PHONY: bash build clean kill push start reset

bash:
	docker compose run server /bin/bash

build:
	docker build --build-arg="FROM_TAG=23.09-py3" -t linmaonly/ubuntu-pytorch-vnc:latest .

clean: kill
	docker compose down -v

kill:
	docker compose kill

push:
	docker push linmaonly/ubuntu-pytorch-vnc:latest

reset: clean
	docker rmi linmaonly/ubuntu-pytorch-vnc:latest
	docker build --build-arg="FROM_TAG=23.09-py3" --no-cache -t linmaonly/ubuntu-pytorch-vnc:latest .

start:
	docker compose up
