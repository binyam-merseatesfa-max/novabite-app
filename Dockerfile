# ─────────────────────────────────────────────────
# Stage 1: Builder
# Wir verwenden Node.js 20 auf Alpine Linux zum Bauen.
# Alpine ist eine sehr kleine Linux-Distribution (~5 MB).
# ─────────────────────────────────────────────────
FROM node:20-alpine AS builder

# Arbeitsverzeichnis im Container festlegen
WORKDIR /app

# Zuerst nur package.json kopieren.
# Docker baut Images in Schichten (Layers). Wenn sich package.json
# nicht ändert, benutzt Docker den gecachten Layer – npm install
# muss dann nicht neu ausgeführt werden. Das spart Zeit.
COPY package*.json ./

# Alle npm-Abhängigkeiten installieren
RUN npm install

# Den restlichen Quellcode in den Container kopieren
COPY . .

# Die React-App für die Produktion bauen.
# Ergebnis: /app/dist mit index.html und assets/
RUN npm run build

# ─────────────────────────────────────────────────
# Stage 2: Production
# Wir verwenden Nginx auf Alpine Linux als Webserver.
# Nginx ist optimiert für das schnelle Ausliefern
# von statischen Dateien.
# ─────────────────────────────────────────────────
FROM nginx:alpine AS production

# Nginx-Konfiguration aus dem Projekt-Repository kopieren.
# Diese Datei sorgt dafür, dass React Router korrekt funktioniert.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Nur die fertigen Build-Dateien aus Stage 1 kopieren.
# Alles andere (Node.js, node_modules, Quellcode) bleibt zurück
# und landet NICHT im finalen Image.
COPY --from=builder /app/dist /usr/share/nginx/html

# Dokumentieren, dass der Container Port 80 verwendet.
# (Der Port wird erst beim Starten des Containers tatsächlich geöffnet.)
EXPOSE 80

# Nginx im Vordergrund starten (wichtig für Container: der Prozess
# darf nicht in den Hintergrund gehen, sonst stoppt der Container sofort)
CMD ["nginx", "-g", "daemon off;"]