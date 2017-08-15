# Nama Sales

![alt demo](http://i.imgur.com/jerOwNY.png)

## Instalação do Projeto

### Dependências

 - Ruby v2.4.1
     - Caso não tenha Ruby instalado em sua máquina, recomendo o uso do [RVM](https://rvm.io/).
 - Rails v5.1.3
 - Sqlite3
 - Git e Git Flow

#### Download

Acesse via terminal o local dos seus projetos e faça o download do repositório.
```bash
$> git clone git@github.com:lppedrohs/nama-sales.git
```

Para utilização do ambiente de desenvolvimento configure o Git Flow.
```bash
$> sudo apt-get install git-flow
$> git flow init
```
Pressione Enter para todas as opções que serão exibidas. Depois disso você já estara na branch de development.

Caso opte por não utilizar Git Flow, é necessário fazer o download da branch `develop` remota.

#### Configuração do Gemset

Dentro da pasta do projeto, crie os arquivos `.ruby-version` e `.ruby-gemset` e depois entre novamente na pasta para carregar as novas configurações.
```bash
$> echo "ruby-2.4.1" > .ruby-version && echo "nama_sales_dev" > .ruby-gemset
$> cd .
```

#### Instalação das dependências

Utilize a ferramenta `bundle` para instalar todas as gems que foram definidas no Gemset do projeto.
```bash
$> gem install bundle
$> bundle install
```

#### Configuração do banco de dados

Para habilitar a comunicação com o banco de dados é necessário configurar o arquivo `config/database.yml`  seguindo o padrão do arquivo `config/database.example.yml` e alterando os dados necessários. Você pode criar o arquivo `config/database.yml` seguindo esse padrão rodando o comando:
```bash
$> cp config/database.example.yml config/database.yml
```

Por fim, crie o banco de dados, rode as migrations e popule o mesmo.
```bash
$> rake db:create db:migrate db:seed
```

#### Testes

Utilizamos o framework de testes Rspec para execução de testes.
```bash
$> rspec
```

#### Start do servidor
```bash
$> rails s
```
