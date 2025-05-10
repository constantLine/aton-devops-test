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
  - `task4_cicd/screenshots/`: Логи, вывод curl и скрины результатов.


## Задание 5: Развертывание инфраструктуры в Yandex Cloud с Terraform
- **Описание**: ВМ с модульной структурой Terraform.
- **Инфраструктура**:
  - ВМ: 2 ядра, 4 ГБ, Ubuntu 22.04.
  - Диск: 30 ГБ, network-ssd.
  - Сеть: VPC, подсеть (192.168.10.0/24), публичный IP.
  - Группа безопасности: Порты 22, 80, 443.
  - User-data: Пользователь `devops`, Docker.
- **Модули**:
  - `compute`: ВМ.
  - `disk`: Диск.
  - `network`: VPC и подсеть.
  - `security_group`: Группа безопасности.
- **Файлы**:
  - `task5_terraform/main.tf`: Основной файл.
  - `task5_terraform/terraform.tfvars , task5_terraform/variables.tf`: Необходимые переменные.
  - `task5_terraform/modules/`: Модули.
  - `task5_terraform/screenshots/`: Скриншоты.
- **Примечание**: Конфигурация адаптирована для task4 (докер, пользователь, порты).