# Hinweise für Claude

## Sprache

**Code immer auf Englisch.** Das gilt für alles, was zur Technik gehört:

- Datei- und Ordnernamen (z. B. `data/events.yaml`, `layouts/_shortcodes/donation-qr.html`). Ausnahme: Dateien unter `content/` bleiben deutsch, weil ihr Name die Adresse der Seite ist (z. B. `content/helfen.md` → `/helfen/`).
- Namen von Shortcodes, Partials, Variablen, CSS-Klassen und Schlüsseln in `config.toml` oder in Dateien unter `data/`
- Kommentare in Templates, CSS, `config.toml` und Workflows
- Fehlermeldungen beim Bauen (`errorf`)

Auf **Deutsch** bleibt alles, was Besucher oder der Vorstand lesen:

- Texte auf der Website, also die Inhalte unter `content/` und sichtbare Texte in Templates (inklusive `alt`-Texten)
- `ANLEITUNG.md` und `README.md`
- Hinweise für den Vorstand in Dateien, die er selbst bearbeitet (z. B. die Kommentare oben in `data/events.yaml`)
- Texte, die Workflows als Kommentar in Pull Requests schreiben
- Commit-Nachrichten sowie Titel und Beschreibung von Pull Requests

## Projekt in Kürze

- Statische Website mit Hugo (Version in `Makefile` und den Workflows), Theme `ananke` als Git-Submodul. Nach dem Klonen: `git submodule update --init`.
- Bauen: `make build`; lokale Vorschau: `make serve`.
- Den Inhalt pflegt der Vorstand ohne technische Vorkenntnisse nach `ANLEITUNG.md`. Wer etwas ändert, das dort beschrieben ist (Dateinamen, Platzhalter, Schlüssel in `config.toml`), passt die Anleitung mit an.
- Vereinsdaten stehen zentral in `config.toml` unter `[params.club]` und kommen per `{{< club "..." >}}` auf die Seiten.
