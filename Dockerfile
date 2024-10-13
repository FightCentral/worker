FROM oven/bun:1.1.30 AS builder

WORKDIR /app

COPY --link bun.lockb package.json ./

RUN bun install --production

COPY . .

FROM builder

COPY --from=builder /app /app

EXPOSE 8081

ENV NODE_ENV=production

CMD ["bun", "start"]
