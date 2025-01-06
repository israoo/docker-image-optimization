# Optimización de imágenes Docker

Este repositorio contiene un ejemplo práctico para construir imágenes Docker más ligeras, seguras y eficientes. Se utiliza una aplicación básica de Node.js para demostrar la diferencia entre un Dockerfile sin optimizar y uno optimizado.

---

## Estructura del repositorio

```plaintext
docker-image-optimization/
├── .dockerignore            # Archivos a excluir
├── Dockerfile.optimized     # Dockerfile optimizado
├── Dockerfile.traditional   # Dockerfile tradicional
├── package-lock.json        # Dependencias del proyecto (bloqueadas)
├── package.json             # Dependencias del proyecto
└── server.js                # Código de la aplicación Node.js
```

---

## Requisitos

1. Docker instalado en tu máquina.
2. Conocimientos básicos de Docker y Dockerfiles.

---

## Instrucciones

1. Clona este repositorio en tu máquina local.

    ```bash
    git clone https://github.com/israoo/docker-image-optimization.git
    cd docker-image-optimization
    ```

2. Construye la imagen Docker sin optimizar.

    ```bash
    docker build -t docker-image-optimization:traditional -f Dockerfile.traditional .
    ```

3. Construye la imagen Docker optimizada.

    ```bash
    docker build -t docker-image-optimization:optimized -f Dockerfile.optimized .
    ```

4. Compara el tamaño de las imágenes.

    ```bash
    docker images | grep docker-image-optimization
    ```

5. Ejecuta el contenedor de cada imagen.

    ```bash
    docker run -d -p 3000:3000 docker-image-optimization:traditional
    docker run -d -p 3001:3000 docker-image-optimization:optimized
    ```

6. Accede a la aplicación en tu navegador.

    - [http://localhost:3000](http://localhost:3000) (tradicional)
    - [http://localhost:3001](http://localhost:3001) (optimizada)

7. Detén y elimina los contenedores.

    ```bash
    docker stop $(docker ps -q)
    docker rm $(docker ps -aq)
    ```

8. Elimina las imágenes.

    ```bash
    docker rmi docker-image-optimization:traditional docker-image-optimization:optimized
    ```

---

## Comparación de imágenes

| Imagen | Tamaño | Usuario |
|--------|--------| ------- |
| docker-image-optimization:traditional | 1120 MB | root |
| docker-image-optimization:optimized |  159 MB | appuser |

La imagen optimizada es 7 veces más pequeña que la imagen tradicional. Además, la imagen optimizada utiliza un usuario no privilegiado para ejecutar la aplicación.

La imagen tradicional contiene los siguientes problemas:

- **Capa de construcción**: La imagen contiene dependencias de desarrollo que no son necesarias en producción.
- **Usuario root**: La aplicación se ejecuta con privilegios de administrador, lo que puede ser un riesgo de seguridad.
- **Capa de caché**: Las capas de caché no se utilizan de manera eficiente, lo que aumenta el tamaño de la imagen.
- **Volumen de trabajo**: La imagen contiene archivos y directorios innecesarios que aumentan el tamaño.
- **Optimización de capas**: Las capas de la imagen no están optimizadas para reducir el tamaño.

---

## Tecnologías utilizadas

- **Node.js**: Entorno de ejecución.
- **Docker**: Contenedores de aplicaciones.
