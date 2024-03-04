# Llama.cpp Dockerize for ARM64

- Check your cpu type & config environment

```# command
$ lscpu
# find 'avx' in Flags
$ nano config.env
```


## Option 1: Docker
- Step 1: Build/Pull Image

```
# build
$ make build-cpu
# or pull
$ make pull-cpu # if have avx using 'pull-cpu-AVX'
```

- Step 2: Download Model (Gemma-2B Quantize 4bit)

```
$ make download_model
```

- Step 3: Start Server

```
$ make start
```

## Option 2: Termux

- Step 1: Set up

```
$ termux-setup-storage (Choose github storage)
# Config
apt update -y && apt upgrade -y && apt install -y clang ndk-multilib git make curl
git clone --depth 1 https://github.com/ggerganov/llama.cpp
make -C llama.cpp -j4
```

- Step 2: Download Model (Gemma-2B Quantize 4bit)

```
make download_model
```

- Step 3: Start Server

```
./llama.cpp/server --model ./models/gemma-2b-it-q4_k_m.gguf --ctx-size 512 --n-gpu-layers -1 --host 0.0.0.0 --port 8900
```
