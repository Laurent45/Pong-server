# Use an official Node.js runtime as the parent image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package*.json to the container
COPY package*.json ./
COPY yarn.lock ./

# Install application dependencies inside the container
RUN yarn install

# Copy the rest of the application to the container
COPY . .

# Generate the Prisma client
RUN npx prisma generate

# Build the application
RUN yarn run build

# Expose port 3000 
EXPOSE 3030

# Start the application in development mode
CMD [ "yarn", "run", "start:dev" ]
