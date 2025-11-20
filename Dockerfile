FROM php:8.2-apache

# Extensiones PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Copiar todo el proyecto al contenedor
COPY . /var/www/html/

# Permisos
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Cambiar DocumentRoot a /var/www/html/public
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# Crear configuración correcta del Directory
RUN printf "<Directory /var/www/html/public>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>\n" > /etc/apache2/conf-available/public.conf \
    && a2enconf public

EXPOSE 80

CMD ["apache2-foreground"]
