# DevOps Test 2025
Репозиторий содержит решения для тестового задания по DevOps.

## Структура
- `task1_ansible/` - Ansible плейбук для настройки Nginx.
- `task2_docker/` - Dockerfile и Docker Compose для Nginx с HTTPS.
- `task3_bash/` - Bash-скрипт для мониторинга диска и отправки алертов.
- `task4_cicd/` - CI/CD пайплайн с использованием GitHub Actions.
- `task5_terraform/` - Terraform скрипты для развертывания инфраструктуры в Yandex Cloud.


## Задание 4: CI/CD пайплайн с GitHub Actions
- **Описание**: Пайплайн для сборки и деплоя Docker-приложения Nginx.
- **CI**: Сборка Docker-образа из `task2_docker/Dockerfile` и сохранение как артефакт.
- **CD**: Доставка образа на сервер через SSH (пользователь: devops) и запуск контейнера.
- **Файлы**:
  - `.github/workflows/ci-cd.yml`: Конфигурация пайплайна.
  - `task4_cicd/screenshots/`: Логи, вывод curl и код HTTP.