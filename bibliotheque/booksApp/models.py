from django.db import models

# Create your models here.
from django.utils import timezone
import datetime


class Book(models.Model):
    id_oeuvre = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=200)
    auteur = models.CharField(max_length=200)
    pub_date = models.DateTimeField("date de publication")
    image = models.ImageField(upload_to='book_images/', null=True, blank=True)
    description = models.TextField(max_length=2000)
    
    def __str__(self):
        return self.titre
    
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)



