# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Cadastro(models.Model):
    id = models.CharField(max_length=20)
    nome = models.CharField(max_length=100)
    email = models.EmailField()
    contato = models.CharField(max_length=15)
    class Meta:
        db_table = "cadastro"
# Create your models here.
