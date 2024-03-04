all: build
include config.env
export $(shell sed 's/=.*//' config.env)

# Docker
build-cpu:
	docker build --build-arg BASE_IMAGE=$(BASE_IMAGE)-t open-llm-cpp:cpu -f Dockerfile.cpu .

pull-cpu:
	docker pull liemthanh/open-llm-cpp:cpu

start:
	docker compose -f docker-compose.yml down
	docker compose -f docker-compose.yml up -d

stop:
	docker compose -f docker-compose.yml down

# pm2
pm2-build-cpu:
	./setup.sh

pm2-sudo-build-cpu:
	sudo ./setup.sh

pm2-start:
	pm2 start start.sh --name "open-llm-cpp-app"

download_model:
	curl -o ./models/gemma-2b-it-q4_k_m.gguf https://aiservices-bucket.s3.amazonaws.com/ai_model/GGUF/gemma-2b-it-q4_k_m.gguf
