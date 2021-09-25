#language: pt

@cadastro
Funcionalidade: Validar cadastro
  Eu como QA
  Desejo validar o cadastro no site automacao com batista

  Cenario: Valida cadastro
    Dado que estou no site automacao com batista
    Quando preencho os dados do usuario e clico em cadastrar
    Entao cadastro um usuario com sucesso