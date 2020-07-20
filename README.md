There is an official dockerfile at https://git.tt-rss.org/fox/ttrss-docker-compose
But it seems to install the newest ttrss on each container start.
Which isn't great for reproducibility

# Quickstart

Note that this isn't a production setup, but fairly close. Make sure to change
the configuration if you intend to use it in production.

    docker-compose up
    # Note the errors in the console and http://localhost:8000/
    # This is due to ttrss not having initialized the database, so:
    docker exec -it ttrssdocker_ttrss_1 sh
    mv /opt/ttrss/config.php /config.php
    # open http://localhost:8000/install/ and get the database initialized
    mv /config.php /opt/ttrss/config.php
    # Now it should work, try logging in with the default admin/password

# Configuration

Look at the env vars available in the `Dockerfile` and
`cont-init.d/ttrss-config.sh`. Make sure to check the settings for the postgres
container in case you want to store the data somewhere permanently or lock down
the postgres version in order to prevent updates that require dumping the
database.
