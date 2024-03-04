apt update -y && apt upgrade -y
apt install -y clang ndk-multilib nodejs-lts
npm install pm2 -g
git clone --depth 1 https://github.com/ggerganov/llama.cpp
make -C llama.cpp -j4