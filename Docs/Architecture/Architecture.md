# Architecture

## Product Shape

Scrap Helper is a single-user, Android-first, local-first application.

The deterministic core handles:

- scrap categories;
- yard profiles and rates;
- object templates;
- recoverable components;
- load building;
- payout ranges;
- receipt reconciliation;
- immutable history.

## Locked Stack

- Flutter
- Dart
- SQLite through `sqflite`
- `flutter_riverpod` with manually declared providers
- Android first

## Excluded from MVP

- backend services;
- user accounts;
- cloud sync;
- subscriptions;
- OCR;
- marketplace scraping;
- automatic template learning;
- bundled local LLM;
- AI-controlled valuation.

## Layer Boundaries

### Domain

Pure Dart logic:

- enums;
- unit conversion;
- integer rounding;
- rate and fee calculation;
- load estimation;
- snapshot contracts.

No Flutter or SQLite imports.

### Data

- SQLite opener;
- schema and migrations;
- models;
- repositories;
- seed handling;
- import and export.

### Features

- categories;
- yards;
- prices;
- templates;
- loads;
- receipts;
- history;
- settings.

### Optional Future Vision Helper

Image recognition may suggest:

- likely object type;
- multiple visible objects;
- candidate local templates.

The user confirms the result. The deterministic core remains authoritative.
