# Usar la imagen de Node.js como base
FROM node:20

# Crear y establecer el directorio de trabajo
WORKDIR /usr/src/app

# Copiar solo package.json y package-lock.json para instalar dependencias
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos de la aplicación
COPY . .

# Exponer el puerto que utiliza tu backend (ajustar según tu configuración)
EXPOSE 3000

# Comando para iniciar la aplicación en modo desarrollo
CMD ["npm", "run", "dev"]
