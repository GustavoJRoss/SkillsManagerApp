# Skill Manager App

Skill Manager App é um aplicativo para gerenciamento de habilidades, onde o usuário pode adicionar, visualizar, editar e excluir habilidades. O app é desenvolvido em Flutter e utiliza o Firebase Firestore para armazenamento dos dados.

## Índice
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Arquitetura](#arquitetura)
- [Configuração do Firebase](#configuração-do-firebase)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Estrutura do Firestore](#estrutura-do-firestore)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Funcionalidades
- **Adicionar Habilidade:** Permite adicionar novas habilidades com título e descrição.
- **Visualizar Habilidades:** Lista todas as habilidades salvas.
- **Editar Habilidade:** Permite editar as informações de uma habilidade existente.
- **Excluir Habilidade:** Permite remover habilidades do banco de dados.
  
## Tecnologias
- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Firebase Firestore**: Banco de dados NoSQL usado para armazenar as habilidades.
- **MVVM (Model-View-ViewModel)**: Arquitetura utilizada no projeto para separar a lógica da interface.

## Arquitetura
O projeto segue o padrão de arquitetura MVVM para separar a lógica da interface, garantindo um código mais organizado e escalável.
- **Model**: Define a estrutura dos dados (ex. `Skill`).
- **ViewModel**: Contém a lógica de negócios e manipulação de dados, incluindo a comunicação com o Firestore.
- **View**: Contém as telas e widgets que exibem as informações ao usuário.

## Configuração do Firebase
1. Acesse o [Firebase Console](https://console.firebase.google.com/) e crie um novo projeto.
2. Adicione um aplicativo da Web ao projeto e copie as configurações para integração com o Firebase.
3. No seu projeto Flutter, adicione o Firebase configurando os arquivos `google-services.json` (para Android) e `GoogleService-Info.plist` (para iOS, caso necessário).
4. No arquivo `index.html` (para Web), adicione as configurações de inicialização do Firebase.

## Instalação

### Pré-requisitos
- [Flutter](https://flutter.dev/docs/get-started/install) instalado na máquina.
- Firebase configurado no projeto Flutter.

### Passos para Clonar o Repositório e Instalar as Dependências
1. Clone o repositório:
   ```bash
   git clone https://github.com/usuario/skill-manager-app.git
   cd skill-manager-app
