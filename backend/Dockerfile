# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

# Copy package files and Prisma schema
COPY package*.json ./
COPY prisma ./prisma/

# Install all dependencies (including devDependencies for compilation)
RUN npm ci

# Generate Prisma Client
RUN npm run prisma:generate

# Copy source code and config
COPY tsconfig.json ./
COPY src ./src

# Build the TypeScript code
RUN npm run build

# Stage 2: Production runner
FROM node:20-alpine AS runner

WORKDIR /usr/src/app

# Copy package files and Prisma schema
COPY package*.json ./
COPY prisma ./prisma/

# Install only production dependencies + Prisma CLI for running migrations
RUN npm ci --only=production && npm install prisma@6.19.3 --no-save

# Copy compiled JavaScript from build stage
COPY --from=builder /usr/src/app/dist ./dist

# Copy generated Prisma Client from build stage
COPY --from=builder /usr/src/app/node_modules/.prisma ./node_modules/.prisma

# Expose the server port
EXPOSE 3000

# Set environment
ENV NODE_ENV=production

# Run migrations and start the server
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/server.js"]
