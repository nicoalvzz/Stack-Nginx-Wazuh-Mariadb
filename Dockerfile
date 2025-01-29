ARG SERVICE
FROM debian:bullseye-slim

# Actualización del sistema e instalación de utilidades esenciales
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    && apt-get clean

# Copia la configuración del servicio si existe
RUN if [ -d "./config/$SERVICE" ]; then \
      cp -r ./config/$SERVICE /etc/$SERVICE; \
    else \
      echo "No se encontró una configuración específica para $SERVICE."; \
    fi

# Definición de los puertos expuestos según el servicio
EXPOSE 80 9200 1514 1515

# Mensaje de confirmación antes de iniciar
CMD ["sh", "-c", "echo El servicio $SERVICE está listo para ejecutarse"]
