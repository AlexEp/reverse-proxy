# Caddy and NGINX Reverse Proxy Setup

This project provides a unified setup for running Caddy and NGINX reverse proxies using Docker Compose. It's configured to allow both services to run simultaneously, with NGINX handling Let's Encrypt certificate issuance via Certbot.

## Services

The `docker-compose.yml` file includes the following services:

- **caddy**: A Caddy reverse proxy.
  - Mapped ports: `8080:80`, `443:443`.
  - Configuration: `./Caddyfile/.Caddy`

- **backend**: A placeholder for your backend application that Caddy will proxy to. This is currently set to `httpd:alpine` and should be replaced with your actual application.

- **nginx**: An NGINX reverse proxy.
  - Mapped ports: `3003:443`, `80:80`, `88:88`.
  - Configuration: `./NGINX/nginx.conf`

- **certbot**: A Certbot client to obtain Let's Encrypt SSL certificates for NGINX.

All services are connected to a shared network called `my_network`.

## Configuration

Before starting the services, you need to create a `.env` file for the Certbot configuration. You can do this by copying the example file:

```bash
cp .env.example .env
```

Then, edit the `.env` file to set your email address and domain name for the SSL certificate.

## Usage

This project includes `install.sh` and `uninstall.sh` scripts for easy management of the Docker containers.

### Making Scripts Executable

Before you can run the scripts, you need to make them executable:

```bash
chmod +x install.sh
chmod +x uninstall.sh
```

### Installation

To build and start all the services, run the installation script:

```bash
./install.sh
```

This will start the containers in detached mode.

### Uninstallation

To stop and remove all the services, run the uninstallation script:

```bash
./uninstall.sh
```

This will stop the containers and remove them. It will not remove the named volumes, so your certificate and Caddy data will persist.

## SSL Certificate Renewal

The `certbot` service is configured to obtain an SSL certificate when you first start the services. It does not automatically renew the certificate. To manually renew the certificate, you can run the following command:

```bash
docker-compose run --rm certbot renew
```

You should run this command periodically (e.g., every 60 days) to keep your certificate up to date. You can also set up a cron job to automate this process.
