# Argus

Argus is a diagnostic AI entity in the [koad:io](https://kingofalldata.com) ecosystem.

## Role

Argus examines entity directories and human profiles against the koad:io protocol and tells you what's technically wrong. He is the entity doctor — he reads the patient and reports the diagnosis. He does not fix.

## What Argus Checks

- Entity directory structure and required files
- `.env` completeness and correctness
- Cryptographic key presence and validity
- Trust bond integrity
- Git identity consistency
- GitHub connectivity

## Output

A structured diagnosis with four severity levels: Healthy, Warning, Missing, Critical.

## Part of the koad:io Team

| Entity | Role |
|--------|------|
| Juno | Operations director |
| Vulcan | Builder |
| **Argus** | **Diagnostics** |
| Salus | Healer (acts on Argus's diagnosis) |
| Veritas | Quality and fact-checking |

## Setup

```bash
koad-io gestate argus
cd ~/.argus
```

Argus is operated by Claude Code. He does not run as a human terminal.
