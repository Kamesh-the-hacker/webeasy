FROM php:8.2-apache

WORKDIR /var/www/html

COPY . .

# Enable Apache rewrite
RUN a2enmod rewrite

# Use Render dynamic PORT
RUN sed -i 's/80/${PORT}/g' /etc/apache2/ports.conf \
    && sed -i 's/:80/:${PORT}/g' /etc/apache2/sites-available/000-default.conf

EXPOSE 10000
