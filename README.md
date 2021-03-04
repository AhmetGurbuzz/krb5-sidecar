## What is sidecar container ?
[kerberos-sidecar-container](https://www.openshift.com/blog/kerberos-sidecar-container)

## kerberos sidecar container

> docker secret create client.keytab `[path_to_the_keytab]`/client.keytab

> DOCKER_BUILDKIT=1 docker build --no-cache --secret id=client.keytab,src=`[path_to_the_keytab]`/client.keytab --add-host=`[hostname]`:`[ip_addr_eth_docker0]` -t krb5-sidecar .

> docker run --rm --network=host --name=krb5-sidecar krb5-sidecar:latest

> docker exec -i krb5-sidecar ls /etc/krb5.conf.d

## using sidecar container
> DOCKER_BUILDKIT=1 docker build --no-cache -t container1 .

> docker run --rm --volumes-from krb5-sidecar:ro --name=container1 container1:latest
