# Use official PHP image
FROM php:8.3-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip curl git libzip-dev && \
    docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY . .

# Expose port 8000 for Laravel
EXPOSE 8000

# Default command to start Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
