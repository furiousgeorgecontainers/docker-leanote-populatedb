This container is to be used as a one-time run to populate the database for the [furiousgeorge/leanote](https://hub.docker.com/r/furiousgeorge/leanote/) container.

## Instructions

### Mongo Database

This container and the [furiousgeorge/leanote](https://hub.docker.com/r/furiousgeorge/leanote/) container require a [mongodb](https://hub.docker.com/_/mongo/) container to be running.

If you do not have a mongodb container running yet, run the following command:

```
docker run --name mongo -v /my/own/datadir:/data/db -d mongo:3.2.3
```

### Populate the database

To populate the database, run this container and link the previously started mongo container:

```
docker run --rm --link mongo:mongo furiousgeorge/leanote-populatedb
```

* Since this container is only needed to run one time to populate the database, the ```--rm``` flag will dispose of the container upon completion.


### Conclusion

Once this container has been run and the database has been populated, this container and image can be discarded and you can proceed with running [furiousgeorge/leanote](https://hub.docker.com/r/furiousgeorge/leanote/).
