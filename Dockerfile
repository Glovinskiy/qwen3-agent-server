FROM ollama/ollama:latest

ADD https://huggingface.co/Burumbum/qwen3-4b-agent-q4km/resolve/main/qwen3-4b-agent-q4km.gguf /models/qwen3-agent.gguf

COPY Modelfile /Modelfile

RUN ollama serve & \
    until ollama list > /dev/null 2>&1; do sleep 1; done && \
    ollama create qwen3-agent -f /Modelfile && \
    pkill ollama || true

EXPOSE 11434
ENTRYPOINT ["ollama", "serve"]
