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
`cont-init.d/ttrss-config.sh`.
