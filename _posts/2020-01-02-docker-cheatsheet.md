---
layout: post
title: Docker Cheatsheet
tags: docker
author: Edison Arango
---

> **INFO**: Replace everything inside <>

# Start docker server in centos
```
sudo systemctl start docker
```

# Build and tag image
```
docker build -t <username>/<project_name>:<tag> <project_path>
```

# Create docker secret
```
echo "<secret>" | docker secret create <secret_name> -
```
> Important: The hyphen(-) is needed  

# Deploy stack with docker-compose file
```
docker swarm init --advertise-addr=<ip_address> (Before deploying stack)
```
docker stack deploy -c <docker_compose_yml> <stack_name>

# When deploy need to pull newer private image
```
docker stack deploy -c <docker_compose_yml> --with-registry-auth <stack_name>
```

# Show running containers
```
docker ps
```

# Enter to container bash
```
docker exec -it <container_id> bash
```

# Remove all containers
```
docker rm $(docker ps -a -q)
```

# Show services of stack
```
docker service ls
```

# Show service logs
```
docker service logs -f --tail <number_of_latest_lines> <service_id>
```

# Show dangling images (Images tagged <none>)
```
docker images -f dangling=true
```

# Remove dangling images
```
docker rmi $(docker images -f dangling=true -q)
```

# Show container using a volume
```
docker ps -a --filter volume=<VOLUME_NAME_OR_MOUNT_POINT>
```

# Copy folder from container to host
```
docker cp <container_id>:/path/to/folder /path/in/host
```

# Disable container auto start
```
docker update --restart=no my-container
```
