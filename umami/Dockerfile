FROM node:22-alpine@sha256:8ea2348b068a9544dae7317b4f3aafcdc032df1647bb7d768a05a5cad1a7683f AS builder
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm 
RUN pnpm install --frozen-lockfile

COPY . .
COPY docker/proxy.ts ./src
ENV DATABASE_URL="postgresql://user:pass@localhost:5432/dummy"

RUN pnpm build-docker


FROM node:22-alpine@sha256:8ea2348b068a9544dae7317b4f3aafcdc032df1647bb7d768a05a5cad1a7683f AS prod

WORKDIR /app

RUN npm install -g pnpm 

COPY --from=builder /app /app
COPY --from=builder /app/.next/standalone ./

ENV NODE_ENV=production

EXPOSE 3000

CMD ["pnpm", "start-docker"]