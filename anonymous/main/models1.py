from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class conversations(models.Model):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)
    title       = models.CharField(max_length=200,blank=True)
    created_at  = models.DateTimeField(auto_now_add=True)
    update_at   =models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.username}-{self.title}"

class Message(models.Model):
    conversations = models.ForeignKey(conversations,related_name='massage',on_delete=models.CASCADE)
    content = models.TextField()
    is_user = models.BooleanField(default=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['timestamp']

    def __str__(self):
        return f"{'user'if self.is_user else 'AI'}: {self.content[:50]}"