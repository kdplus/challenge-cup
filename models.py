# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class DivorceData(models.Model):
    path = models.CharField(max_length=200)
    content = models.TextField()
    laws = models.CharField(max_length=500, blank=True, null=True)
    place = models.CharField(max_length=30, blank=True, null=True)
    year = models.IntegerField(blank=True, null=True)
    lb1 = models.IntegerField(blank=True, null=True)
    lb2 = models.IntegerField(blank=True, null=True)
    lb3 = models.IntegerField(blank=True, null=True)
    lb4 = models.IntegerField(blank=True, null=True)
    lb5 = models.IntegerField(blank=True, null=True)
    lb6 = models.IntegerField(blank=True, null=True)
    lb7 = models.IntegerField(blank=True, null=True)
    lb8 = models.IntegerField(blank=True, null=True)
    lb9 = models.IntegerField(blank=True, null=True)
    lb10 = models.IntegerField(blank=True, null=True)
    lb11 = models.IntegerField(blank=True, null=True)
    lb12 = models.IntegerField(blank=True, null=True)
    lb13 = models.IntegerField(blank=True, null=True)
    lb14 = models.IntegerField(blank=True, null=True)
    lb15 = models.IntegerField(blank=True, null=True)
    lb16 = models.IntegerField(blank=True, null=True)
    lb17 = models.IntegerField(blank=True, null=True)
    lb18 = models.IntegerField(blank=True, null=True)
    lb19 = models.IntegerField(blank=True, null=True)
    lb20 = models.IntegerField(blank=True, null=True)
    lb21 = models.IntegerField(blank=True, null=True)
    mental_pros = models.IntegerField(blank=True, null=True)
    mental_def = models.IntegerField(blank=True, null=True)
    soldier_pros = models.IntegerField(blank=True, null=True)
    soldier_def = models.IntegerField(blank=True, null=True)
    missing_pros = models.IntegerField(blank=True, null=True)
    missing_def = models.IntegerField(blank=True, null=True)
    foreign_pros = models.IntegerField(blank=True, null=True)
    foreign_def = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'divorce_data'
