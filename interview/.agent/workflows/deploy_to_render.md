---
description: How to deploy the application to Render
---

# Deploying to Render

Since we have created a `render.yaml` Blueprint file, deployment is automated.

## Prerequisites
- You must have a [Render account](https://render.com/).
- Your code must be pushed to a GitHub/GitLab repository.

## Steps

1.  **Push Changes**: Ensure all recent changes (including `render.yaml`, `Dockerfile` updates, and `settings.py` changes) are committed and pushed to your remote repository.
    ```bash
    git add .
    git commit -m "Prepare for Render deployment"
    git push origin main
    ```

2.  **Go to Render Dashboard**: Log in to [dashboard.render.com](https://dashboard.render.com/).

3.  **Create Blueprint**:
    - Click the **New +** button in the top right.
    - Select **Blueprint**.

4.  **Connect Repository**:
    - Find your repository in the list and click **Connect**.
    - If you haven't connected your GitHub account yet, you'll need to do that first.

5.  **Review & Apply**:
    - Render will detect the `render.yaml` file.
    - It will show you the services it's about to create:
        - `crm-backend` (Web Service)
        - `crm-frontend` (Web Service)
        - `crm_db` (PostgreSQL)
        - `crm_redis` (Redis)
        - `celery-worker` (Background Worker)
        - `celery-beat` (Background Worker)
    - **Important**: Check the plan types. I set them to `free` in the file, but Render might require a paid plan for Redis or Workers depending on their current pricing.
    - Click **Apply Blueprint**.

6.  **Wait for Deployment**:
    - Render will start building your Docker images.
    - You can watch the logs in the dashboard.
    - Once finished, your app will be live at the URL provided by Render (e.g., `https://crm-frontend.onrender.com`).
