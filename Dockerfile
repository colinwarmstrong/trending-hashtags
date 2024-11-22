# Base image
FROM node:22.11.0-alpine

# Define working directory
WORKDIR /app

# Install dependencies
COPY ./ ./
RUN npm install

# Start Express server
ENTRYPOINT ["node", "app.js"]
