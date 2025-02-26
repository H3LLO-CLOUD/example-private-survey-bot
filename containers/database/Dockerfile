FROM postgres:17.2

COPY ./init.sql /docker-entrypoint-initdb.d/

COPY ./healthcheck.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/healthcheck.sh

HEALTHCHECK CMD ["sh", "-c", "/usr/local/bin/healthcheck.sh"]
