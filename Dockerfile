# Use Node official image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app code
COPY . .

# Expose Node port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

