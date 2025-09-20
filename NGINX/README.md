# NGINX with Certbot and Docker Compose

This directory contains the configuration for running NGINX as a reverse proxy with Certbot for automatic SSL certificate management. The entire setup is orchestrated using Docker Compose.

## Overview

The `docker-compose.yml` file defines two services:

*   **`nginx`**: An NGINX container that acts as a reverse proxy. It is configured to:
    *   Listen on port 80 for HTTP traffic, primarily to handle Let's Encrypt's ACME challenges.
    *   Redirect all other HTTP traffic to HTTPS.
    *   Listen on port 3003 for HTTPS traffic (mapped from port 443 in the container).
    *   Proxy HTTPS requests to a backend service running on `host.docker.internal:5678`.
*   **`certbot`**: A Certbot container that automates the process of obtaining and renewing SSL certificates from Let's Encrypt. It uses the `webroot` method for domain validation.

## Configuration

*   **`docker-compose.yml`**: Defines the services, volumes, and ports.
*   **`nginx.conf`**: The main NGINX configuration file. It sets up the HTTP and HTTPS server blocks, defines the reverse proxy settings, and specifies the paths to the SSL certificates.

## Prerequisites

*   Docker
*   Docker Compose

## Usage

1.  **Customize the configuration**:
    *   In `docker-compose.yml`, change the email address in the `certbot` service's command to your own.
    *   Also in the `certbot` service's command, replace `my-star.duckdns.org` with your domain name.
    *   In `nginx.conf`, replace `my-star.duckdns.org` with your domain name.
    *   In `nginx.conf`, you may want to change the `proxy_pass` directive to point to your actual backend service.

2.  **Start the services**:
    Open a terminal in this directory and run:
    ```sh
    docker-compose up -d
    ```

3.  **Stop the services**:
    To stop the containers, run:
    ```sh
    docker-compose down
    ```
    To stop the containers and remove the volumes (including the SSL certificates), run:
    ```sh
    docker-compose down -v
    ```
