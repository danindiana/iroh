---
name: Local Relay / QAD Issue
about: Report issues with local relay setup, QUIC Address Discovery, or examples
labels: documentation
---

## Summary
Briefly describe the problem.

## Environment
- OS / Distro:
- Rust toolchain (`rustc -V`):
- iroh commit/tag:

## Setup Steps
- Did you use `scripts/local-relay-setup.sh`? (y/n)
- Cert generation command used:
- Relay config path and contents (redact secrets):
- Client config snippet (`iroh.config.toml`):

## Commands and Logs
- Relay start command and relevant log lines (attach or paste relevant excerpt):
- Example command (transfer/unreliable) and output:
- `RUST_LOG` used:

## Network Checks
- Output of `ss -tulpn | grep -E '(:3340|:7842|:9090)'`:
- Any firewall rules in effect?

## Expected vs Actual
- Expected behavior:
- Actual behavior:

## Additional Context
Screenshots, Wireshark captures, or any other context.
