# Fork Notes (danindiana/iroh)

This fork maintains additional local development and relay/QAD documentation not (yet) merged upstream.

## Added Materials
- `docs/local-relay-dev.md`: End-to-end local relay + QUIC Address Discovery workflow.
- `docs/README.md`: Documentation index for easier discovery.
- `scripts/local-relay-setup.sh`: Helper script to bootstrap certs & configs.
- Troubleshooting table appended to `docs/local-relay-dev.md`.
- CONTRIBUTING guidance for reproducing networking issues.

## Intent
Focus on rapid iteration for relay experimentation and documentation improvements without waiting for upstream review cycles.

## Sync Strategy
To pull in latest upstream changes while preserving fork-only docs:
```
git remote add upstream https://github.com/n0-computer/iroh.git  # if not already
git fetch upstream
# Rebase (preferred) or merge:
git checkout main
git rebase upstream/main   # resolve conflicts if any
# Push updated main to fork
git push origin main
```
If conflicts arise in added docs, prefer keeping fork content unless upstream has adopted equivalent guidance.

## Upstream Contribution Path
When specific pieces stabilize and are broadly useful, cherry-pick related commits onto a clean branch and open a focused upstream PR.

## Tagging
Snapshot tags (e.g. `local-relay-qad-setup-2025-11-12`) capture known-good states of relay experimentation for reference.

## Future Ideas
- Add an automated doc link checker (GitHub Action) scoped to the fork.
- Provide a containerized local relay dev environment.
- Include a minimal smoke test harness verifying local relay QAD during CI.
