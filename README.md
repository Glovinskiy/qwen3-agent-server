# Qwen3 Agent Server

Docker image for self-hosted deployment of a fine-tuned **Qwen3-4B** model via [Ollama](https://ollama.com).  
The model is quantized (Q4_K_M) and optimized for agent/instruction-following tasks.

## Model

**[Burumbum/qwen3-4b-agent-q4km](https://huggingface.co/Burumbum/qwen3-4b-agent-q4km)** on HuggingFace

- Base: Qwen3-4B
- Quantization: Q4_K_M (GGUF)
- Fine-tuned for: agent tasks, structured output, tool use
- Context window: 4096 tokens

## Quick Start

### Run with Docker

```bash
docker pull ghcr.io/glovinskiy/qwen3-agent-server:latest
docker run -d -p 11434:11434 ghcr.io/glovinskiy/qwen3-agent-server:latest
```

### Build locally

```bash
git clone https://github.com/Glovinskiy/qwen3-agent-server.git
cd qwen3-agent-server
docker build -t qwen3-agent-server .
docker run -d -p 11434:11434 qwen3-agent-server
```

## API Usage

The server exposes the standard **Ollama REST API** on port `11434`.

```bash
# Generate
curl http://localhost:11434/api/generate -d '{
  "model": "qwen3-agent",
  "prompt": "Extract the following fields from the text as JSON: name, email, phone",
  "stream": false
}'

# Chat
curl http://localhost:11434/api/chat -d '{
  "model": "qwen3-agent",
  "messages": [{"role": "user", "content": "Your message here"}],
  "stream": false
}'
```

## Use in n8n

Set HTTP Request node:
- **URL:** `http://your-server:11434/api/generate`
- **Method:** POST
- **Body:** `{ "model": "qwen3-agent", "prompt": "{{ $json.text }}", "stream": false }`

## Stack

- [Ollama](https://ollama.com) — LLM runtime
- [Qwen3-4B](https://huggingface.co/Qwen/Qwen3-4B) — base model by Alibaba
- Docker — containerized deployment

## Author

**Mykhailo Hlovynskyi** — No-Code Automation Developer & AI Integrator

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mykhailo-hlovynskiy-34317835b/)
[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=flat&logo=telegram&logoColor=white)](https://t.me/Hlovynskiy)
[![HuggingFace](https://img.shields.io/badge/HuggingFace-FFD21E?style=flat&logo=huggingface&logoColor=black)](https://huggingface.co/Burumbum)
