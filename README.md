# Database for Ceylon Herd

This image is based on the [official PostgreSQL image](/_/postgres) and set up for use with the [Herd web server](../ceylon-herd-web) using [these instructions](https://github.com/ceylon-docker/herd-web).

The following images/tags are available:

 - `latest` ([herd-dbase/Dockerfile](https://github.com/ceylon-docker/herd-dbase/blob/master/Dockerfile))

To run the server perform the following steps:

 1. `docker pull ceylon/ceylon-herd-dbase:latest`
 2. Create a folder for the database, eg: `mkdir /tmp/herddb`
 3. `docker run --name herddb -d -v /tmp/herddb:/var/lib/postgresql/data ceylon/ceylon-herd-dbase:latest`

NB: You can of course use a different output folder than the `/tmp/herddb` used in the example but you *have* to use it's full path in the command!
NB2: In this example we've named the container `herddb`. This is not required but makes it easier to follow the instructions for setting up the [Herd web server](../ceylon-herd-web)
NB3: In this example we're pulling and running the image that is tagged `:latest`. You can replace it with any other tag or you can leave it out if you want (it will default to `:latest` automatically).

