# Etapa 1: Construcción
# Utilizamos una imagen de Node.js optimizada para desarrollo
FROM node:20 AS build

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiamos únicamente los archivos necesarios para instalar dependencias
COPY package*.json ./

# Instalamos solo las dependencias necesarias para producción
RUN npm install --only=production

# Copiamos el resto del código fuente de la aplicación
COPY . .

# Etapa 2: Ejecución
# Utilizamos una imagen limpia de Node.js para la ejecución de la app
FROM node:20

# Establecemos el mismo directorio de trabajo que en la etapa de construcción
WORKDIR /usr/src/app

# Copiamos los archivos generados en la etapa de construcción
COPY --from=build /usr/src/app /usr/src/app

# Exponemos el puerto en el que corre el backend
EXPOSE 3000

# Configuramos el comando por defecto para iniciar la aplicación
CMD ["npm", "start"]
