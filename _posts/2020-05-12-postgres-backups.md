---
layout: post
title: Postgres Backups
tags: postgres
author: Edison Arango
---

## Backup

### Dump entire database into SQL
```
pg_dump -h <host> -p <port> -U <user> <db_name> > <filename>.sql
```
> The `port` is not required in case it's the default

Example: 
```
pg_dump -h example.com -p 5000 -U jhondoe nasa > backup.sql
```

### Dump entire database skipping ownership of objects (Usually required when target database has a different user)
```
pg_dump --no-owner -h <host> -p <port> -U <user> <db_name> > <filename>.sql
```
> The `port` is not required in case it's the default

### To dump the database in inserts and data only into an SQL file:
```
pg_dump --column-inserts --data-only -h <host> -U <user> <db_name> > <filename>.sql
```  
 
## Restore  

### Restore backup
```
psql -h <host> -p <port> -U <user> -d <db_name> < <filename>.sql
```

Example: 
```
psql -h example.com -p 5000 -U jhondoe -d nasa < backup.sql
```
