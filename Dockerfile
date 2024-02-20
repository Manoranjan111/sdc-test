# Use a Node.js base image
FROM node:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm i -g @nestjs/cli
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Use a lightweight Node.js image for production
FROM node:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist/

# Install production dependencies
RUN npm install --only=production

# Expose port 3000 (or any port your Nest.js app uses)
EXPOSE 8000

# Command to run the built application
CMD ["node", "./dist/main"]