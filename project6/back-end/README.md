## Webapp repo for school project @ university of applied sience.

Dit is de repo voor de AMC app. Onderstaand een aantal instructies over Silverstripe:

### Opnieuw bouwen van database
Om de database opnieuw op te bouwen na het aanmaken van nieuwe velden of na het toevoegen nieuwe modules gebruik je:

```php
	www.example.com/dev/build
```

### Legen cache geheugen
Silverstripe wordt helemaal plat gecached. Als je nieuwe functionaliteiten toevoegd dien je het cachegeheugen te legen omdat je anders geen veranderingen ziet. Dit doe je door:

```php
	www.example.com/?flush
```







