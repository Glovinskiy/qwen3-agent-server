FROM ghcr.io/ggerganov/llama.cpp:server

ADD https://huggingface.co/Burumbum/qwen3-4b-agent-q4km/resolve/main/qwen3-4b-agent-q4km.gguf /models/model.gguf

CMD ["--model", "/models/model.gguf", "--port", "8080", "--host", "0.0.0.0", "-c", "4096"]
