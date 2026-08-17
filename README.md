# Cloud PC for GitHub Codespaces

A browser-accessible **Ubuntu + XFCE desktop** that runs inside a GitHub Codespace.

This is designed as a temporary development desktop, not a 24/7 VPS.

## Start it

1. Create a new GitHub repository.
2. Upload the contents of this ZIP to the repository.
3. Commit the files.
4. Click **Code → Codespaces → Create codespace on main**.
5. Let the setup finish.
6. Open the **PORTS** tab.
7. Find **6080 — Cloud PC Desktop**.
8. Keep visibility **Private** and click **Open in Browser**.

The desktop should also try to open automatically.

## Useful commands

Restart the desktop:

```bash
bash scripts/start-desktop.sh
```

Check status/logs:

```bash
bash scripts/status-desktop.sh
```

Stop only the desktop processes:

```bash
bash scripts/stop-desktop.sh
```

## What you get

- XFCE Linux desktop
- Terminal
- File manager
- Text editor
- Python 3 + pip
- Node.js + npm
- Git, curl, wget
- VS Code in the Codespaces browser as usual

## Free usage

GitHub personal accounts include limited monthly Codespaces usage. GitHub Free currently includes
120 core-hours/month and 15 GB-month storage; GitHub Pro includes 180 core-hours/month and 20 GB-month
storage. A 2-core Codespace burns 2 core-hours for every real hour it stays active.

Stop the Codespace when you are done so it does not waste your quota.

## Security

Keep port **6080 Private**. The VNC server itself only listens on localhost and has no VNC password,
because access is intended to be protected by GitHub's private forwarded-port authentication.

Do not change the forwarded port to Public unless you also add your own authentication.

## About the Windows files you uploaded

The previous `windows10.yml` uses `dockur/windows`, which requires KVM hardware virtualization and
substantially more disk. That is a nested virtual-machine setup, so it is not a reliable Codespaces
solution. This project avoids KVM entirely and gives you an actual browser desktop that Codespaces can
run much more realistically.
