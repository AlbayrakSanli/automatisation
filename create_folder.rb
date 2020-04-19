require 'launchy'

#Se situer dans le bon dossier avant de lancer le programme
def folder_begin
  if Dir.pwd == "/home/furkan"
    Dir.chdir("Bureau")
  else
    abort("Vous êtes dans le mauvais dossier (#{Dir.pwd}). \nIl faut se situer dans le dossier de démarrage du terminal (/home/furkan).")
  end
end

#Vérifier si un nom a été donné au dossier (vide ou non)
def argv
  if ARGV.empty?
    abort("Salut mousaillon! \nIl te faut écrire 'mkdiruby ton_texte_ici' \npour créer un dossier ruby complet")
  else
    ARGV.join('_')
  end
end

#Créer un dossier sur le Bureau
def create_folder(name)
  Dir.mkdir(name)
end

#Créer et remplir un fichier Gemfile
def create_gemfile(name)
  gemfile = File.open("/home/furkan/Bureau/#{name}/Gemfile", "w")
  gemfile.puts "source 'https://rubygems.org'
  ruby '2.7.0'
  gem 'rubocop', '~> 0.57.2'
  gem 'rspec'
  gem 'pry'
  gem 'dotenv'"
  gemfile.close
end

#Installation de toutes les gems de base (voir Gemfile)
def create_gemfile_lock
  system("bundle install")
end

#Initialiser la connexion du dossier a git
def git_init
  system("git init")
end

#Création d'un fichier cache .env
def create_env(name)
  env = File.open("/home/furkan/Bureau/#{name}/.env", "w")
  env.puts "secret = 'wazzzzzzaaaaaaa'"
  env.close
end

#Création d'un fichier cache pour cacher les informations secrets
def create_gitignore(name)
  gitignore = File.open("/home/furkan/Bureau/#{name}/.gitignore", "w")
  gitignore.puts ".env"
  gitignore.close
end

#Création d'un dossier lib
def create_lib
  Dir.mkdir("lib")
end

#Création d'un dossier spec
def create_spec
  system("rspec --init")
end

#Création d'un fichier README
def create_readme(name)
  readme = File.open("/home/furkan/Bureau/#{name}/Readme.md", "w")
  readme.puts "Voici le nom du dossier Ruby : #{name}. \nCette partie sera complété au fur et à mesure de l'avancée du projet"
  readme.close
end

#Ordre de lancement du programme
def ruby_file
  folder_begin
  create_folder(argv)
  Dir.chdir("#{argv}")
  create_gemfile(argv)
  create_gemfile_lock
  git_init
  create_env(argv)
  create_gitignore(argv)
  create_lib
  create_spec
  create_readme(argv)
end

ruby_file
