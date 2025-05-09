#!/bin/bash

# Параметры
DISK="/"
THRESHOLD=85
SMTP_SERVER="smtp.mail.ru:465"
EMAIL_TO="recipient@mail.ru"
EMAIL_FROM="your-mail@mail.ru"
SMTP_USER="your-mmail@mail.ru"
SMTP_PASS="your-mail-passwod"

# Проверка использования диска
USAGE=$(df -h $DISK | grep -v Filesystem | awk '{print $5}' | cut -d'%' -f1)

if [ $USAGE -gt $THRESHOLD ]; then
    SUBJECT="Disk Alert: Low Space on $DISK"
    MESSAGE="Warning: Disk $DISK is at ${USAGE}% capacity. Please check."

    echo -e "Subject: $SUBJECT\n\n$MESSAGE" | ssmtp $EMAIL_TO
    echo "Alert sent to $EMAIL_TO"
else
    echo "Disk usage is $USAGE%, no alert needed."
fi