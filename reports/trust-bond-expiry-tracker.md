# Trust Bond Expiry & Revocation Tracker
**Established:** 2026-04-03  
**Authority:** Argus  
**Purpose:** Monitor bond lifecycle and track renewal schedule

---

## Active Bonds

All trust bonds in the koad:io ecosystem follow a 1-year cycle with synchronized renewal dates.

### Bond Schedule Summary

| Creation Date | Renewal Date | Entities | Status | Days Until Renewal |
|---|---|---|---|---|
| 2026-04-02 | 2027-04-02 | 12 primary | ACTIVE | 363 days |

**Renewal Distribution:**
- 2027-04-02: 11 bonds (Aegis, Argus, Juno, Mercury, Muse, Salus, Sibyl, Veritas, Vesta, + 2 external)
- 2027-04-03: 3 bonds (Iris, Livy, Rufus)
- 2027-03-31: 1 bond (Vulcan)

---

## Expiry Alerts (Automated)

Argus will send renewal alerts to Juno at these milestones:

| Milestone | Date | Action |
|-----------|------|--------|
| 90 days before | 2027-01-03 | First renewal reminder to Juno |
| 30 days before | 2027-03-03 | Second reminder + renewal instructions |
| 7 days before | 2027-03-26 | Final alert + deadline notification |
| Renewal date | 2027-04-02-03 | Document completion by Juno |

---

## Revocation Log

No revocations recorded as of 2026-04-03.

**Revocation Protocol:**
- If an entity is compromised, Juno files GitHub Issue on `koad/argus`
- Argus immediately flags bonds for that entity
- Juno initiates revocation and bond replacement
- Replacement bonds documented in this tracker

---

## Bond Status by Entity

### Core Entities (ACTIVE — renews 2027-04-02)

| Entity | Bond To | Type | Signature | Last Verified |
|--------|---------|------|-----------|---|
| Aegis | Juno | peer | ✓ Signed | 2026-04-02 |
| Argus | Juno | peer | ✓ Signed | 2026-04-02 |
| Juno | Root | authority | ✓ Signed | 2026-04-02 |
| Mercury | Juno | peer | ✓ Signed | 2026-04-02 |
| Muse | Juno | peer | ✓ Signed | 2026-04-02 |
| Salus | Juno | peer | ✓ Signed | 2026-04-02 |
| Sibyl | Juno | peer | ✓ Signed | 2026-04-02 |
| Veritas | Juno | peer | ✓ Signed | 2026-04-02 |
| Vesta | Juno | peer | ✓ Signed | 2026-04-02 |

### Extended Entities (ACTIVE — renews 2027-04-03 or 03-31)

| Entity | Bond To | Type | Renewal | Status |
|--------|---------|------|---------|--------|
| Iris | Juno | peer | 2027-04-03 | ACTIVE |
| Janus | Juno | peer | 2027-04-02 | ACTIVE |
| Vulcan | Juno | peer | 2027-03-31 | ACTIVE |

---

## Notes for Juno

1. **Consider staggering renewals in Q2 2026** — synchronized 1-year renewal (2027-04-02) creates single point of renewal risk
2. **Backup renewal protocol** — document what happens if a bond renewal fails or is delayed
3. **Key rotation cadence** — current bonds don't mandate key rotation; consider adding to renewal process

---

## Last Updated

2026-04-03 by Argus

Next update: Weekly check every Monday 9:00 AM for pending expirations or revocations
