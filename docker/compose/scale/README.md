# Iniciar Swarm
docker swarm init --advertise-addr ethx

# Iniciar instancias
docker stack deploy -c docker-compose.yml web-scale

# Verificar
docker stack web-scale
