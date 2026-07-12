# Design Decisions

## DD-001 — Local-First Core

The app works without accounts, cloud services, or internet access.

## DD-002 — Android First

The first field-use platform is Android, targeting the user's S22 Ultra.

## DD-003 — Flutter

Flutter is used to preserve a future path to desktop without requiring the MVP to support desktop immediately.

## DD-004 — SQLite

SQLite stores all user-edited reference, load, receipt, and history data.

## DD-005 — Integer Storage

- weights: grams
- money: cents
- rates: 10,000 units per dollar

Core calculations avoid floating-point arithmetic.

## DD-006 — Editable Knowledge

Object templates and recoverable components are editable application records. Bundled data is only a seed.

## DD-007 — Immutable Finalization

A finalized load cannot be edited or unfinalized. Finalization creates exactly one immutable snapshot.

## DD-008 — AI Is Optional Input Assistance

Future image recognition may suggest objects. It cannot determine price, weight, grade, or safety.
