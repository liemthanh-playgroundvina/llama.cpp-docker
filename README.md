# Llama.cpp Dockerize for ARM64

- Check your cpu type & config environment

```# command
$ lscpu
# find 'avx' in Flags
$ nano config.env
```


## Run
- Step 1: Build/Pull Image

```
make build-cpu/pull-cpu
```

- Step 2: Download Model (Gemma-2B Quantize 4bit)

```
make download_model
```

- Step 3: Start Server

```
make start
```
