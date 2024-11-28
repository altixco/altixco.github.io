---
tags: docker, django, postgres
author: Edwin Moreno
---

# Steps to Copy Database and Media Files to Localhost

## Export a Dump of the Postgres Database

Run the following command on the server to export a dump of the database:

```bash
dokku postgres:export asi-website > asi-website.dump
```

## Download the Dump File from the Server

Transfer the dump file from the server to your local machine:

```bash
scp root@asisas.com.co:asi-website.dump ./asi-website-nov-2024.dump
```

## Import the Dump File into Local Postgres (Docker)

1. Access the local Postgres container:
   ```bash
   docker exec -it asi-website-postgres psql -U postgres
   ```

2. Drop the existing database (if any):
   ```sql
   DROP DATABASE asi_website;
   ```

3. Create a new empty database:
   ```sql
   CREATE DATABASE postgres;
   ```

4. Exit the Postgres client:
   ```sql
   \q
   ```

5. Copy the dump file to the Postgres container:
   ```bash
   docker cp asi-website-nov-2024.dump asi-website-postgres:/asi-website.dump
   ```

6. Restore the dump file inside the Postgres container:
   ```bash
   docker exec -it asi-website-postgres bash
   pg_restore -U postgres -d postgres --clean ./asi-website.dump
   ```

## Copy and Download the Media Files

### Create a Compressed File of Media Directory on the Server

1. On the server, compress the `media` directory:
   ```bash
   zip -r media.zip /var/lib/dokku/data/storage/asi-website/media
   ```

### Download the Media File to Local Machine

2. Download the compressed file:
   ```bash
   scp root@asisas.com.co:media.zip .
   ```

3. Remove the existing `media` directory (if any):
   ```bash
   rm -rf ../media
   ```

4. Extract the downloaded `media.zip` file:
   ```bash
   unzip media.zip -d ../media
   ```
