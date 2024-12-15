# Etapa de construcción (Build Stage)
FROM node:20-alpine AS build-stage

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos de dependencias y realizar instalación
# Utilizar COPY separado para aprovechar el caché de Docker
COPY package*.json ./
RUN npm install

# Copiar el resto del código fuente y construir el proyecto
COPY . . 
RUN npm run build

# Etapa de producción con Nginx
FROM nginx:1.25-alpine

# Directorio por defecto donde Nginx busca archivos estáticos
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html

# Copiar la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# Comando para mantener Nginx en ejecución
CMD ["nginx", "-g", "daemon off;"]



