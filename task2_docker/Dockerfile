FROM nginx:latest

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем сертификаты
COPY certs/server.crt /etc/nginx/certs/server.crt
COPY certs/server.key /etc/nginx/certs/server.key

# Копируем статическую страницу
COPY html/index.html /usr/share/nginx/html/index.html

# Открываем порты
EXPOSE 80 443