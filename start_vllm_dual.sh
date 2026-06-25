#!/bin/bash
export HF_HOME=/workspace/hf-cache
exec /venv/main/bin/vllm serve Qwen/Qwen3-32B-AWQ \
    --quantization awq_marlin \
    --tensor-parallel-size 2 \
    --max-model-len 5120 \
    --gpu-memory-utilization 0.92 \
    --kv-cache-dtype fp8 \
    --enable-auto-tool-choice \
    --tool-call-parser hermes \
    --enforce-eager \
    --max-num-seqs 32 \
    --served-model-name baraka-chat \
    --enable-prefix-caching \
    --host 0.0.0.0 \
    --port 8000
