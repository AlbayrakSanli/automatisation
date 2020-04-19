require 'launchy'

def argv
  if ARGV.empty?
    abort("Salut mousaillon! \nIl te faut écrire 'search ton_texte_ici' \npour lancer ce programme de recherche Google")
  else
    ARGV
  end
end

def make_url
  return "https://www.google.com/search?q=" + argv.join('+')
end

Launchy.open(make_url) 