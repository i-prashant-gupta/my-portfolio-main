# Step 1: Use official Node.js image with a version >= v18.19
FROM node:18 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Step 4: Install Angular CLI and project dependencies
RUN npm install -g @angular/cli
RUN npm install

# Step 5: Copy the rest of the Angular project files
COPY . .

# Step 6: Expose port 4200 for the Angular development server
EXPOSE 4200

# Step 7: Run Angular development server (ng serve)
CMD ["ng", "serve", "--host", "0.0.0.0"]
