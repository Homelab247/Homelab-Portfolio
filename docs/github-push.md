# GitHub Push

Wenn das GitHub-Repository leer erstellt wurde, kann der lokale Stand so hochgeladen werden.

## Remote setzen

```bash
git remote add origin https://github.com/<username>/<repo>.git
```

Falls `origin` bereits existiert:

```bash
git remote set-url origin https://github.com/<username>/<repo>.git
```

## Branch setzen und pushen

```bash
git branch -M main
git push -u origin main
```

## Vor dem Push prüfen

```bash
git status
git log --oneline -5
```

Wichtig: Vor dem Push keine Secrets, Tokens oder internen Zugangsdaten committen.
