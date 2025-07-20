from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index, name='index'),  # Page d'accueil
    path('about/', views.about, name='about'),  # Page À propos
    path('books/', views.book_list, name='book_list'),  # Liste des livres
    path('addLink/', views.add_book, name='add_book'), 
    path('editLink/<int:pk>/', views.edit_book, name='edit_book'),
    path('deleteLink/<int:pk>/', views.delete_book, name='delete_book'),
    path('', views.login_view, name='login'),
    path('logout_',views.logout,name='logoutlink'),
]