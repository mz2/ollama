#!/bin/bash
set -e

OLLAMA_HOST=$(snapctl get host)
OLLAMA_MODELS=$(snapctl get models)
OLLAMA_ORIGINS=$(snapctl get origins)

CUDA_VISIBLE_DEVICES_VALUE=$(snapctl get cuda-visible-devices)
if [ -n "$CUDA_VISIBLE_DEVICES_VALUE" ]; then
    export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES_VALUE
fi

OLLAMA_LLM_LIBRARY=$(snapctl get ollama-llm-library)
if [ -n "$OLLAMA_LLM_LIBRARY" ]; then
    export OLLAMA_LLM_LIBRARY
fi

export OLLAMA_HOST OLLAMA_MODELS OLLAMA_ORIGINS
$SNAP/bin/ollama "$@"
