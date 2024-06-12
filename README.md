# App de Investimentos

## Visão Geral

Este projeto tem como objetivo construir um aplicativo de investimentos do zero. O processo de desenvolvimento seguirá os princípios de Domain-Driven Design (DDD), focando na definição de domínios, capacidades e domínios relacionados para estruturar o framework Core Mobile. O aplicativo incorporará ferramentas de Injeção de Dependência (DI), Network, Feature Flag, LocalStore, Analytics e Observabilidade para garantir um sistema robusto, escalável e de fácil manutenção.

## Índice

- [Objetivos do Projeto](#objetivos-do-projeto)
- [Domain-Driven Design (DDD)](#domain-driven-design-ddd)
- [Framework Core Mobile](#framework-core-mobile)
  - [Injeção de Dependência (DI)](#injeção-de-dependência-di)
  - [Rede](#rede)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação](#instalação)
- [Uso](#uso)
- [Contribuindo](#contribuindo)
- [Licença](#licença)
- [Contato](#contato)

## Objetivos do Projeto

- **Construir um aplicativo de investimentos de alta qualidade do zero.**
- **Seguir os princípios de Domain-Driven Design (DDD).**
- **Definir domínios e capacidades claras.**
- **Utilizar ferramentas e práticas modernas de desenvolvimento.**
- **Garantir que o aplicativo seja escalável, de fácil manutenção e robusto.**

## Domain-Driven Design (DDD)

Domain-Driven Design (DDD) é uma abordagem de desenvolvimento de software que enfatiza a colaboração entre especialistas técnicos e de domínio para refinar iterativamente um modelo conceitual que aborda a lógica de domínio complexa.

### Conceitos Chave

- **Domínio**: A lógica de negócios e regras centrais.
- **Entidades**: Objetos com uma identidade distinta.
- **Objetos de Valor**: Objetos imutáveis sem identidade distinta.
- **Agregados**: Um cluster de entidades e objetos de valor.
- **Repositórios**: Métodos para acessar agregados.
- **Serviços**: Operações que não se encaixam naturalmente em entidades ou objetos de valor.
- **Fábricas**: Métodos para criar objetos complexos.

## Framework Core Mobile

### Injeção de Dependência (DI)

Injeção de Dependência é um padrão de design usado para implementar IoC (Inversão de Controle), permitindo a criação de objetos dependentes fora de uma classe e fornecendo esses objetos à classe.

- [Guia completo (DI)](docs/di/README.md/)

### Rede

O módulo de rede lidará com todas as solicitações HTTP, chamadas de API e operações relacionadas à rede.

- [Guia completo (NetworkManager)](docs/network/README.md/)


## Estrutura do Projeto

```
investment-series/
│
│
├── scripts/         # Scripts auxiliares
│   ├── xcodegen/
│   ├── podfile/
│
├── libraries/Core/         # Módulos core
│   ├── DI/
│   ├── Network/
│
└── project.yml
└── Podfile
└── tools.sh
```

## Instalação

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/comitando/investment-series.git
   cd investment-app
   ```

3. **Faça a configuração do projeto.**

   ```bash
   ./tools.sh
   ```

4. **Gere o projeto Xcode:**

   ```bash
   xcodegen generate
   ```

3. **Instale as dependências do CocoaPods:**

   ```bash
   pod install
   ```

## Uso

- **Execute o aplicativo em um simulador ou dispositivo físico a partir do Xcode.**
- **Use a documentação fornecida e os comentários para entender a implementação.**
- **Consulte os modelos de domínio e serviços para estender ou modificar o aplicativo.**

## Contribuindo

Agradecemos contribuições para melhorar este projeto. Para contribuir:

1. **Faça um fork do repositório.**
2. **Crie uma nova branch:**

   ```bash
   git checkout -b feature/sua-funcionalidade
   ```

3. **Faça suas alterações e comite-as:**

   ```bash
   git commit -m 'Adicionar nova funcionalidade'
   ```

4. **Faça o push para a branch:**

   ```bash
   git push origin feature/sua-funcionalidade
   ```

5. **Crie um pull request.**

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Para perguntas ou sugestões, abra uma issue no GitHub ou entre em contato pelo email [comittando@gmail.com](mailto:comittando@gmail.com).

---

Obrigado pelo seu interesse neste projeto! Vamos construir algo incrível juntos.