# Generated by Django 5.0.4 on 2024-04-25 08:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trainingpoint', '0006_alter_hocky_namhoc_nam_hoc_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='thamgia',
            name='state',
            field=models.IntegerField(choices=[(1, 'Điểm danh'), (2, 'Báo thiếu')], default=None, null=True),
        ),
    ]