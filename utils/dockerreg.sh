docker stop registry
docker rm registry
docker run -d -p 443:5000 \
    -v /home/gongysh/Documents/docker/certs:/certs \
    -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/dev-docker-registry.com.crt \
    -e REGISTRY_HTTP_TLS_KEY=/certs/dev-docker-registry.com.key \
    -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry \
    -v /mnt/data/dockerregistry:/var/lib/registry \
    --restart=always --name registry \
    registry:2
