class Cadastro < SitePrism::Page
  set_url '/users/new'

  element :nome, '#user_name'
  element :ultimoNome,    '#user_lastname'
  element :email,         '#user_email'
  element :endereco,      '#user_address'
  element :universidade,  '#user_university'
  element :profissao,     '#user_profile'
  element :genero,        '#user_gender'
  element :idade,         '#user_age'
  element :salvar, :xpath, '//*[@id="new_user"]/div[5]/div/div/input'
  element :sucesso, '#notice'
  element :nomeObtido, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[1]'
  element :ultimoNomeObtido, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[2]'
  element :emailObtido, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[3]'
  element :universidadeObtida, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[4]'
  element :generoObtido, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[5]'
  element :profissaoObtida, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[6]'
  element :idadeObtida, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[7]'
  element :enderecoObtido, :xpath, '/html/body/div[2]/div[2]/div[3]/div/p[8]'

  def gerar_massa
    massa = {
      nome: Faker::Name.first_name,
      ultimoNome: Faker::Name.last_name,
      email: Faker::Internet.email(domain: 'gmail.com'),
      endereco: Faker::Address.city,
      universidade: 'Nyco Testes',
      profissao: 'QA',
      genero: 'Masculino',
      idade: rand(18..50).to_s
    }
  end

  def cadastrar(massa)
    raise'Falha ao carregar pagina de cadastro'if page.current_path != '/users/new'
    nome.visible?
    nome.set massa[:nome]
    ultimoNome.set massa[:ultimoNome]
    email.set massa[:email]
    endereco.set massa[:endereco]
    universidade.set massa[:universidade]
    profissao.set massa[:profissao]
    genero.set massa[:genero]
    idade.set massa[:idade]
    salvar.click
  end

  def validar_cadastro(massa)
    raise 'Falha ao efetuar cadastro' if sucesso.text != 'Usuário Criado com sucesso'
    raise "Nome cadastrado difere do nome digitado, digitado: #{massa[:nome]}, obtido: #{nomeObtido.text}" unless  nomeObtido.text.include?(massa[:nome])
    raise "Ultimo nome cadastrado difere do digitado, digitado: #{massa[:ultimoNome]}, obtido #{ultimoNomeObtido.text}" unless ultimoNomeObtido.text.include?massa[:ultimoNome]
    raise "Email cadastrado difere do digitado, digitado: #{massa[:email]}, obtido #{emailObtido.text}" unless emailObtido.text.include?massa[:email]
    raise "Universidade cadastrada difere do digitado, digitado: #{massa[:universidade]}, obtido #{universidadeObtida.text}" unless universidadeObtida.text.include?massa[:universidade]
    raise "Genero cadastrado difere do digitado, digitado: #{massa[:genero]}, obtido #{generoObtido.text}" unless generoObtido.text.include?massa[:genero]
    raise "Profissao cadastrada difere do digitado, digitado: #{massa[:profissao]}, obtido #{profissaoObtida.text}" unless profissaoObtida.text.include?massa[:profissao]
    raise "Idade cadastrada difere do digitado, digitado: #{massa[:idade]}, obtido #{idadeObtida.text}" unless idadeObtida.text.include?massa[:idade]
    raise "Endereco cadastrado difere do digitado, digitado: #{massa[:endereco]}, obtido #{enderecoObtido.text}" unless enderecoObtido.text.include?massa[:endereco]
  end
end