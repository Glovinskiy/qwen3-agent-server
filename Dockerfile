FROM ollama/ollama:latest

COPY Modelfile /Modelfile

RUN ollama serve & sleep 10 && \
    ollama create qwen3-agent -f /Modelfile && \
    pkill ollama || true

EXPOSE 11434
ENTRYPOINT ["ollama", "serve"]
