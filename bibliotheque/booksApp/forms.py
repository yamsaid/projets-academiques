from django import forms
from .models import Book

#formulaire pour ajouter un livre

class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields = ['titre', 'auteur', 'pub_date', 'image', 'description']

#formulaire pour modifier un livre
