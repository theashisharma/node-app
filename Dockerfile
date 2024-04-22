# Use the official Node.js image as the base image
FROM node:latest

# Install PostgreSQL
RUN apt-get update && apt-get install -y postgresql postgresql-contrib

# Create a directory for the application
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Copy the modified setup script into the Docker image
COPY setup-postgres.sh /usr/src/app/setup-postgres.sh
RUN apt-get update && apt-get install -y nano
RUN service postgresql start
# Run the setup script
RUN echo "user1             root               postgres" >> /etc/postgresql/15/main/pg_ident.conf
RUN sed -i 's/^local\s\+all\s\+postgres\s\+peer/local   all             postgres                                peer map=user1/' /etc/postgresql/15/main/pg_hba.conf

RUN chmod +x /usr/src/app/setup-postgres.sh
RUN /usr/src/app/setup-postgres.sh
# Expose port 8080
EXPOSE 8080 5432

# Run npm install to install dependencies
RUN npm install
# Command to start the application
#CMD ["node", "server.js"]
CMD ["sh", "-c", "service postgresql start && node server.js"]