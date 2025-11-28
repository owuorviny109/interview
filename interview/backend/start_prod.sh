#!/bin/sh

# Run migrations
echo "Running migrations..."
python manage.py migrate

# Create superuser if it doesn't exist
echo "Creating superuser..."
python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
username = '$DJANGO_SUPERUSER_USERNAME';
email = '$DJANGO_SUPERUSER_EMAIL';
password = '$DJANGO_SUPERUSER_PASSWORD';
if username and password:
    if not User.objects.filter(username=username).exists():
        print(f'Creating superuser {username}...');
        User.objects.create_superuser(username, email, password);
    else:
        print(f'Superuser {username} already exists.');
"

# Start server
echo "Starting Gunicorn..."
exec gunicorn config.wsgi:application --bind 0.0.0.0:8000 --workers 3
