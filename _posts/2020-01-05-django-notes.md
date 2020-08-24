---
tags: django
author: Edison Arango
---

## Django as a PRO

Database access optimization:
- <https://docs.djangoproject.com/en/3.0/topics/db/optimization/>

## Commands

### Dumpdata indented
```
python manage.py dumpdata <app> --indent=2 > <filename>.json
```

### Dumpdata with natural keys (No numeric) and indented
```
python manage.py dumpdata <app> --natural-foreign --natural-primary --indent=2 > <filename>.json
```

## Python Scripts

Make password hash:
```python
from django.contrib.auth.hashers import make_password
make_password('1234abcd')
```

Check password:
```python
from django.contrib.auth.models import User
user = User.objects.get(username='username')
user.check_password('1234abcd')
```
