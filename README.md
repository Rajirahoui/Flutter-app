Projet Flutter - Page de connexion et Upload de fichier

Description

Le projet Flutter a été développé en équipe de deux par Aya Handiri et Raji Rahoui dans le cadre d'un travail universitaire. L'idée était de créer une application mobile où un utilisateur peut s'inscrire, se connecter et uploader des fichiers en utilisant la plateforme Supabase pour la gérance de l'authentification et du dépôt des fichiers.

Le projet a été réalisé en un week-end et chaque membre de l'équipe a géré une fonctionnalité d'importance capitale du projet.

Fonctionnalités

Page d'inscription et d'authentification :
La page d'inscription est utilisée par les utilisateurs pour créer un compte en utilisant leur email et mot de passe.
Suit l'inscription réussie, l'utilisateur peut se connecter à l'aide des mêmes identifiants.
Upload de fichiers :
L'utilisateur peut uploader des fichiers à l'aide d'une page spécifique.
Le fichier est téléchargé dans un bucket Supabase et peut être lu ou téléchargé à l'avenir.
Backend avec Supabase :
Supabase a été utilisé pour la gestion de l'authentification des utilisateurs et du stockage des fichiers.
Les utilisateurs peuvent accéder uniquement à leur propre fichier, et des règles de sécurité ont été créées pour s'assurer que cela arrivera.
Outils utilisés

Flutter : Framework mobile pour développer l'application.
Dart : Langage de programmation utilisé pour Flutter.
Supabase : Backend-as-a-Service for storing and authenticating files.
Git/GitHub : Team collaboration and version control tool for managing project source code.
Project structure

Below is an overview of our project structure :

lib/
├── main.dart # Application entry point
├── uploadpage.dart # File upload page
├── auth.dart # Authentication and registration page
├── services/ # Services to interact with Supabase
├── auth_service.dart # Authentication management
├── profile_page.dart # File upload management


Contributions

1. Aya Handiri - File upload system
Role: Aya a réalisé la page de upload de fichier. L'utilisateur peut sélectionner un fichier et l'uploader sur Supabase Storage.
Technologies utilisées : Flutter, Supabase, FilePicker.
Défis : intégration avec Supabase Storage et gestion des erreurs d'upload.
2. Raji Rahoui - Page d'authentification
Role: Raji a réalisé la page de inscription et de connexion, où les utilisateurs peuvent créer un compte et se connecter avec leurs identifiants.
Technologies utilisées : Flutter, Supabase.
Défis : Configuration de l'authentification sécurisée avec Supabase et des sessions utilisateur.
Installation et Prérequis

Cloner le repository :
git clone https://github.com/votre-utilisateur/flutter-auth-upload.git
Installez les dépendances Flutter :
flutter pub get
Configurez Supabase :
Créer un projet Supabase et configurer l'URL et la clé API dans le fichier lib/main.dart sous la section Supabase.initialize().
Lancer l'application sur un simulateur ou un appareil :
flutter run
Conclusion

Cette mission fut développée en un week-end, sous forme de gestion collaborative sur GitHub, et a permis à chaque membre d'être en charge d'aspects spécifiques du développement mobile avec Flutter et Supabase. C'était une expérience épanouissante en matière de gestion de projet, de collaboration en équipe, et de mise en place d'une solution backend moderne
