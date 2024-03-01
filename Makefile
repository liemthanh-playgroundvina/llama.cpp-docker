# Build and start
build-cpu:
	docker build -t open-llm-cpp:cpu -f Dockerfile.cpu .

pull-cpu:
	docker pull liemthanh/open-llm-cpp:cpu

start:
	docker compose -f docker-compose.yml down
	docker compose -f docker-compose.yml up -d

stop:
	docker compose -f docker-compose.yml down

download_model:
	curl -o ./models/gemma-2b-it-q4_k_m.gguf https://aiservices-bucket.s3.amazonaws.com/ai_model/GGUF/gemma-2b-it-q4_k_m.gguf
