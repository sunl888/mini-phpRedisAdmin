phpRedisAdmin
=============

phpRedisAdmin is a simple web interface to manage [Redis](http://redis.io/)

Instead of using composer, you can also do a manual install using:

```
git clone https://github.com/ErikDubbelboer/phpRedisAdmin.git
cd phpRedisAdmin
git clone https://github.com/nrk/predis.git vendor
```

Docker Image
============
A public [phpRedisAdmin Docker image](https://hub.docker.com/r/erikdubbelboer/phpredisadmin/) is available on Docker Hub [automatically built](https://docs.docker.com/docker-hub/builds/) from latest source.
The file ```includes/config.environment.inc.php``` is used as the configuration file to allow environment variables to be used as configuration values.
Example:
```
docker run --rm -it -e REDIS_1_HOST=myredis.host -e REDIS_1_NAME=MyRedis -p 80:80 wqer/mini-phpredisadmin
```
Also, a Docker Compose manifest with a stack for testing and development is provided. Just issue ```docker-compose up --build``` to start it and browse to http://localhost. See ```docker-compose.yml``` file for configuration details.
