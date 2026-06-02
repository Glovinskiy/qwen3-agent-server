FROM ollama/ollama:latest

COPY Modelfile /Modelfile

RUN ollama serve & \
    until ollama list > /dev/null 2>&1; do sleep 1; done && \
    ollama create qwen3-agent -f /Modelfile && \
    pkill ollama || true

EXPOSE 11434
ENTRYPOINT ["ollama", "serve"]
