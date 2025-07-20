from django.shortcuts import render, redirect, get_object_or_404
from .models import Book
from .forms import BookForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login as auth_login
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login
from django.http import HttpResponseForbidden
from django.contrib import messages


def index(request):
    return render(request, 'booksApp/index.html')

def about(request):
    developers = [
        
        {
            'name': 'Saïdou YAMEOGO',
            'role': 'Développeur Full Stack',
            'description': '''Etudiant en 2ème année Licence Professionnelle en Analyse Statistique à l'Institut 
            Supérireur des Sciences de la Population (ISSP) situé dans l'Université Joseph Ki-Zerbo de Ouagadougou, 
            jes suis particulièrement passionné par la data science, le développement web et la création d\'applications innovantes.''',
            'image': 'booksApp/images/said.jpg'
        },
        {
            'name': 'Orianne-Aurele SAWADOGO',
            'role': 'Développeur Full Stack',
            'description': '''Etudiante en 2eme année Licence Professionnelle en Analyse Statistique
                                à l'Institut Supérieur des Sciences de la population (ISSP). Passionnée   par le développement web et la création d\'applications innovantes.''',
            'image': 'booksApp/images/aurele.jpg'
        },
        # Ajoutez d'autres développeurs ici
    ]
    return render(request, 'booksApp/about.html', {'developers': developers})

def book_list(request):
    latest_book_list = Book.objects.all()
    return render(request, 'booksApp/book_list.html', {'latest_book_list': latest_book_list})


def is_admin(user):
    return user.is_staff


@login_required
@user_passes_test(is_admin)
def add_book(request):
    if request.method == 'POST':
        form = BookForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Le livre a été ajouté avec succès.')
            return redirect('index')
    else:
        form = BookForm()
    return render(request, 'booksApp/add_book.html', {'form': form})

@login_required
@user_passes_test(is_admin)
def edit_book(request, pk):
    try:
        book = get_object_or_404(Book, id_oeuvre=pk)
        if request.method == 'POST':
            form = BookForm(request.POST, request.FILES, instance=book)
            if form.is_valid():
                form.save()
                messages.success(request, 'Le livre a été modifié avec succès.')
                return redirect('index')
        else:
            form = BookForm(instance=book)
        return render(request, 'booksApp/edit_book.html', {'form': form})
    except Exception as e:
        messages.error(request, f'Une erreur est survenue : {str(e)}')
        return redirect('index')

@login_required
@user_passes_test(is_admin)
def delete_book(request, pk):
    book = get_object_or_404(Book, id_oeuvre=pk)
    if request.method == 'POST':
        book.delete()
        messages.success(request, 'Le livre a été supprimé avec succès.')
        return redirect('index')
    return render(request, 'booksApp/delete_book.html', {'book': book})


def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            auth_login(request, user)
            messages.success(request, f"Bienvenue {user.username} !")
            return redirect('index')  # Remplace 'home' par le nom de ton URL d'accueil
        else:
            messages.error(request, "Nom d'utilisateur ou mot de passe incorrect.")
    else:
        form = AuthenticationForm()
    return render(request, 'booksApp/login.html', {'form': form})

def logout(request):
    return render(request, 'booksApp/logout.html')



def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')  # Redirige vers la page de connexion après inscription
    else:
        form = UserCreationForm()
    return render(request, 'booksApp/register.html', {'form': form})