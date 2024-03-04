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
# build
$ make build-cpu
# or pull
$ make pull-cpu # if have avx using 'pull-cpu-AVX'
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
$ apt install -y clang ndk-multilib git make curl nodejs-lts
$ npm install pm2 -g

# build
$ git clone https://github.com/liemthanh-playgroundvina/llama.cpp-docker
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
