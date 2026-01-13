# 02 Local Setup

This section explains how to set up your local environment.

## 1. Install Tools

- Node.js (LTS)
- npm or yarn
- Git

## 2. Clone the Repository

1. Clone the repo.
2. Create a new branch for your work.

## 3. Environment Variables

Create a local `.env` file with these keys:

- `VITE_API_BASE_URL` (example: `https://api.dev.scp.local`)
- `VITE_KEYCLOAK_URL` (example: `https://auth.dev.scp.local`)
- `VITE_KEYCLOAK_REALM` (example: `scp`)
- `VITE_KEYCLOAK_CLIENT_ID` (example: `scp-ui`)

Do not commit `.env` files to git.

## 4. Start the Frontend

1. Install dependencies.
2. Run the dev server.
3. Open the app in the browser.

## Checklist

- Dev server starts without errors
- App can reach API base URL
- Keycloak login page loads
