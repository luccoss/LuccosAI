FROM node:24-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends unzip \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY LUCCO-webshop-backend.zip .
RUN unzip -q LUCCO-webshop-backend.zip
WORKDIR /app/lucco-store
ENV HOST=0.0.0.0 LUCCO_MODE=demo
CMD ["sh", "-c", "if [ -n \"$RAILWAY_PUBLIC_DOMAIN\" ]; then export BASE_URL=\"${BASE_URL:-https://$RAILWAY_PUBLIC_DOMAIN}\"; fi; exec node server.mjs"]
