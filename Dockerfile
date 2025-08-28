FROM alpine:latest

ARG PB_VERSION=0.25.8
ARG PB_ADMIN_EMAIL
ARG PB_ADMIN_PASSWORD

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN apk add --no-cache unzip && \
    unzip /tmp/pb.zip -d /pb/

# create admin user if env vars are provided
RUN if [ -n "$PB_ADMIN_EMAIL" ] && [ -n "$PB_ADMIN_PASSWORD" ]; then \
        /pb/pocketbase admin create $PB_ADMIN_EMAIL $PB_ADMIN_PASSWORD; \
    fi

# uncomment to copy the local pb_migrations dir into the container
# COPY ./pb_migrations /pb/pb_migrations

# uncomment to copy the local pb_hooks dir into the container
# COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080

# start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]