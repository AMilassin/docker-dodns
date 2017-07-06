
Docker for Digital Ocean based DynDNS

This docker includes a small script which updates the IP address of the Digital Ocean domain DNS record based on the external IP address of the machine it's running on.

External API is provided by 'ipify.org' service, thanks for that!

Configuration file format for dodns.conf.js

```
/*
 * Configuration file
 */
module.exports = {
  // Digital Ocean Public API Token
  // request one at: https://cloud.digitalocean.com/settings/api/tokens
  doPublicToken: '',

  // list of domains to update with dynamic IP
  domains: [
    {
      // name of domain (e.g: google.com)
      domain: '',
      // list of subdomains to update to new IP (e.g: www)
      subdomains: [
        '',
      ],
    },
  ],
};
```

The script supports multiple domains for updating, just add them one-by-one in the configuration file.


# Running the container

A pre-built version of the container is available at Docker Hub - [https://hub.docker.com/r/amilassin/docker-dodns/](https://hub.docker.com/r/amilassin/docker-dodns/).


```
docker run -d -v <local application data folder>:/config:rw amilassin/docker-dodns
```



# Building the container

If you want to build the container yourself just clone this repo and run the following command:

```
 docker build -t dodns .
```


