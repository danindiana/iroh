#!/usr/bin/env bash
set -euo pipefail

# relay-smoke-test.sh
# Builds and runs iroh-relay briefly, verifies expected ports are listening, then cleans up.

ROOT_DIR=$(git rev-parse --show-toplevel)
cd "$ROOT_DIR"

# Ensure setup artifacts
scripts/local-relay-setup.sh

# Build relay
cargo build -p iroh-relay

# Run relay in background
RUST_LOG="info,iroh_relay=debug,iroh_relay::quic=info" \
  target/debug/iroh-relay --config-path tmp/iroh-relay.config.toml --dev \
  > tmp/relay-smoke.log 2>&1 &
PID=$!
trap 'kill $PID >/dev/null 2>&1 || true' EXIT

# Wait a bit for startup
for i in {1..20}; do
  if ss -tulpn | grep -q ":3340\|:7842\|:9090"; then
    ok=1; break
  fi
  sleep 0.3
done

if [[ ${ok:-0} -ne 1 ]]; then
  echo "Relay did not expose expected ports within time window" >&2
  echo "Last log lines:" >&2
  tail -n 100 tmp/relay-smoke.log || true
  exit 1
fi

echo "Relay ports appear to be listening (3340/7842/9090)." >&2

# Done; process will be killed by trap
