from django.db import models
from cloudinary import uploader
from django.dispatch import receiver


# Create your models here.
class Product(models.Model):
    name = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to="uploud/", null=True)


@receiver(models.signals.post_delete, sender=Product)
def delete(sender, instance, **kwargs):
    img = instance.image

    if img:
        uploader.destroy(img.name)
        