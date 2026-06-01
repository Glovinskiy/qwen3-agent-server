FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    cmake build-essential libcurl4-openssl-dev git curl \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/ggerganov/llama.cpp /llama.cpp \
    && cd /llama.cpp \
    && cmake -B build -DLLAMA_CURL=ON \
    && cmake --build build --config Release -t llama-server -j$(nproc)

ADD https://huggingface.co/Burumbum/qwen3-4b-agent-q4km/resolve/main/qwen3-4b-agent-q4km.gguf /models/model.gguf

EXPOSE 8080
CMD ["/llama.cpp/build/bin/llama-server", "--model", "/models/model.gguf", "--port", "8080", "--host", "0.0.0.0", "-c", "2048", "--no-mmap", "-t", "4"]
