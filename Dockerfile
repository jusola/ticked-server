FROM node:13-alpine

# Built by deploy-node-app

WORKDIR /app

ENV NODE_ENV="production"

# Add common build deps
RUN chown -R node /app /home/node && \
  rm -rf /var/lib/apt/lists/*

USER node

COPY package.json yarn.loc[k] package-lock.jso[n] /app/

RUN npm install --production --no-cache --no-audit

COPY . /app/

CMD ["node", "index.js"]