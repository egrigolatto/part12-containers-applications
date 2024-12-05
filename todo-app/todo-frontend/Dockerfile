# Primera etapa: instalar dependencias y ejecutar pruebas
FROM node:20 AS test-stage

WORKDIR /usr/src/app

# Copiar el código fuente y los archivos necesarios
COPY . .

# Instalar dependencias
RUN npm ci

# Ejecutar las pruebas
RUN npm run test

# Segunda etapa: construir la aplicación
FROM node:20 AS build-stage

WORKDIR /usr/src/app

COPY . .

RUN npm ci

RUN npm run build

# Tercera etapa: servidor de producción con Nginx
FROM nginx:1.25-alpine

# Copiar los archivos generados al directorio de Nginx
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html
