#! /usr/bin/env bash

# print_header func
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
print_header() {
  echo .
  echo =====================
  printf "$header\n"
  echo =====================
  echo .
}

setup_xcodegen() {
  header="Setup Xcodegen"; print_header;
  xcodegen --version
  if [[ $? != 0 ]] ; then
  	echo "Xcodegen not found. Starting installation..."
  	brew install xcodegen
  	echo "Xcodegen installed. Version:"; xcodegen --version
  else
  	brew upgrade xcodegen
  	echo "Xcodegen updated. Version:"; xcodegen --version
  fi
}

setup_bundler() {
  header="Setup Bundler"; print_header;
  gem install bundler -v 2.4.22
  bundle update --bundler
  bundle install
}

setup_rake() {
  header="Setup Rake"; print_header;
  rake --version
  if [[ $? != 0 ]] ; then
  	echo "Rake not found. Starting installation..."
  	gem install rake
  	echo "Rake installed. Version:"; rake --version
  else
  	gem update rake
  	echo "Rake updated. Version:"; xcodegen --version
  fi
}

setup_rbenv() {
	echo "⏳ - Instalando Rbenv 💎"
	{ 
		brew install rbenv
		} || {}
	{ 
		which rbenv
		echo " "
		echo "✅ - Rbenv instalado! 💎" 
		echo " "
		echo " "
		echo " "
		echo "⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️"
		echo "TALVEZ SEJA NECESSÁRIO QUE REINICIE O SEU TERMINAL"
		echo "⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️"
	} || {
		echo "Houve um erro ao procurar o Rbenv, provavelmente não está instalado."
	}
}

setup_ruby() {
	{ 
		echo " "
		echo "⏳ - Verificando Rbenv 💎"
		rbenv --version 
		echo " " 
		echo "✅ - Rbenv OK! 💎" 
		echo " "
	} || {
		echo "Não foi detectado o comando rbenv no seu terminal, se você tem certeza que foi instalado talvez seja necessário fechar e abrir novamente seu terminal."
		exit 1
	}

	echo " "
	echo "⏳ - Verificando Ruby 2.7.2 💎"
	echo " "

	{ 
		rbenv global 2.7.2
	} || {
		echo " "
		echo "⏳ - Instalando Ruby 2.7.2 💎 (rbenv)"
		echo " "
		{
			rbenv install 2.7.2
		} || {
			echo " "
			echo "❌ - Problemas ao instalar o ruby"
			exit 1
		}

		echo " "
		echo "✅ - Ruby 2.7.2 instalado! 💎" 
		echo " "
		## O problema está AQUI!!!
		setup_ruby
	}

	echo " "
	echo "✅ - Ruby 2.7.2 colocado como default! 💎" 
	echo " "
	echo "⚠️ Atenção, confira abaixo se a versão do ruby ficou a 2.7.2"
	echo " "
	ruby --version
	echo " "
	echo "Se não tiver a 2.7.2, significa que houve problemas na instalação."
	echo "Provavelmente causados pelo seu shell."
    echo " "
}

header="Starting tools setup"; print_header
setup_rake
setup_xcodegen
setup_rbenv
setup_ruby
setup_bundler