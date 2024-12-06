# FROM node:20

# WORKDIR /usr/src/app

# COPY . .

# # Cambia npm ci a npm install ya que vamos a estar en modo de desarrollo
# RUN npm install

# # npm run dev es el comando para iniciar la aplicación en modo de desarrollo
# CMD ["npm", "run", "dev", "--", "--host"]

FROM node:20

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

CMD ["npm", "run", "dev", "--", "--host"]


