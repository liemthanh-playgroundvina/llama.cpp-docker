# Llama.cpp Dockerize for Termux (ARM64)

## Option 1: Docker

- Step1: Check your cpu type & config environment

```# command
$ lscpu
# find 'avx' in Flags
$ nano config.env
```
- Step 2: Build/Pull Image

```
# clone
$ git clone https://github.com/liemthanh-playgroundvina/llama.cpp-docker
$ cd llama.cpp-docker

# build
$ make build-cpu

# or pull
$ make pull-cpu
```

- Step 3: Download Model (Gemma-2B Quantize 4bit)

```
$ make download_model
```

- Step 4: Start Server

```
$ make start
```

## Option 2: Termux

- Step 1: Set up & build

```
# setup
$ termux-setup-storage (Choose github storage)
$ apt update -y && apt upgrade -y
$ apt install -y git make curl 

# build
$ git clone https://github.com/liemthanh-playgroundvina/llama.cpp-docker
$ cd llama.cpp-docker
$ make build-cpu-local
```

- Step 2: Download Model (Gemma-2B Quantize 4bit)

```
$ make download_model
```

- Step 3: Start Server

```
$ make pm2-start
```



## Services
```
http://localhost:8900/

# curl
curl --location 'http://0.0.0.0:8900/v1/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer' \
--data '{
    "model": "gemma-2b-it-q4_k_m.gguf",
    "stream": false,
    "stop": ["<end_of_turn>"],
    "temperature": 0.8,
    "n": 1,
    "messages": [
	{"role": "system", "content": "You are a helpful assistant."},
	{"role": "user", "content": "Hello!"},
	...
	]
  }'
```