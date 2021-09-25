Dado('que estou no site automacao com batista') do
    @cadastro = Cadastro.new
    @cadastro.load
  end
  
  Quando('preencho os dados do usuario e clico em cadastrar') do
    @massa = @cadastro.gerar_massa
    @cadastro.cadastrar(@massa)
  end
  
  Entao('cadastro um usuario com sucesso') do
    @cadastro.validar_cadastro(@massa)
  end