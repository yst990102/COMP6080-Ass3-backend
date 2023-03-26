FROM node:16

COPY /ssl/cert.crt /etc/ssl/certs/
COPY /ssl/cert.key /etc/ssl/private/

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 5005
CMD [ "npm", "start" ]
