# Stage 1 - PHP with Composer
FROM php:8.3-cli

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    unzip curl git libzip-dev && \
    docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy app code
WORKDIR /var/www/html
COPY . .

# Expose port
EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
