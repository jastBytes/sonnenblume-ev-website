# Sonnenblume e.V. Oberems

Dies ist der Code der Website des Sonnenblume e.V. Oberems.

## Technologie

- Die Seite basiert auf dem statischen Website Generator [Hugo](https://gohugo.io/).
- Für das Hosting wird Github Pages genutzt.
- Der Sourcecode liegt auf Github.

## Inhalte anpassen

- Die Inhalte der Seite liegen unter [content](/content/).
- Das Format der Dateien ist [Markdown](https://de.wikipedia.org/wiki/Markdown#).
- Werden Änderungen auf dem `main` Branch des Repositories commited, werden diese Änderungen automatisch veröffentlicht.
- Kontaktdaten des Vereins (E-Mail, Anschrift, IBAN, Registereintrag) stehen zentral in [config.toml](/config.toml) unter `[params.verein]` und werden auf den Seiten mit `{{< verein "iban" >}}` usw. eingebunden. Das Impressum enthält die Angaben bewusst direkt im Text.

## Vorschau

- Für jeden Pull Request wird automatisch eine Vorschau gebaut; der Link erscheint als Kommentar im Pull Request.
- Lokal lässt sich die Seite mit `make serve` starten (lädt beim ersten Aufruf Hugo herunter) und ist dann unter <http://localhost:1313/sonnenblume-ev-website/> erreichbar.
- Das Theme ist als Git-Submodul eingebunden. Nach dem Klonen einmal `git submodule update --init` ausführen.
