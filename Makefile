all: build
include config.env
export $(shell sed 's/=.*//' config.env)

build-cpu:
	docker build --build-arg BASE_IMAGE=$(BASE_IMAGE)-t open-llm-cpp:cpu -f Dockerfile.cpu .

pull-cpu:
	docker pull liemthanh/open-llm-cpp:cpu

pull-cpu-AVX:
	docker pull liemthanh/open-llm-cpp:cpu-AVX

start:
	docker compose -f docker-compose.yml down
	docker compose -f docker-compose.yml up -d

stop:
	docker compose -f docker-compose.yml down

download_model:
	curl -o ./models/gemma-2b-it-q4_k_m.gguf https://aiservices-bucket.s3.amazonaws.com/ai_model/GGUF/gemma-2b-it-q4_k_m.gguf
