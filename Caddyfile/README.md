# Caddy with Docker Compose

This directory contains the configuration for running Caddy as a reverse proxy using Docker Compose.

## Overview

The `docker-compose.yml` file defines two services:

*   **`caddy`**: A Caddy container that acts as a reverse proxy. It automatically handles HTTPS for you.
*   **`backend`**: A placeholder for your backend application. You should replace the `image` in the `docker-compose.yml` with your actual application's image.

## Configuration

*   **`docker-compose.yml`**: Defines the `caddy` and `backend` services and connects them to the same Docker network.
*   **`Caddyfile`**: The Caddy configuration file. It's configured to:
    *   Reverse proxy requests for `example.com` to the `backend` service on port 5000.
    *   Use the email `alex.myreg@gmail.com` for SSL certificate registration.

## Prerequisites

*   Docker
*   Docker Compose

## Usage

1.  **Customize the configuration**:
    *   In `Caddyfile`, change `example.com` to your domain and update the email address.
    *   In `docker-compose.yml`, change the `image` for the `backend` service to your application's image.

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
    To stop the containers and remove the volumes, run:
    ```sh
    docker-compose down -v
    ```
