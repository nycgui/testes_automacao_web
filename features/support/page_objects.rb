Dir[File.join(File.dirname(__FILE__),
  '../pages/*.rb')].sort.each { |file| require file }


module PageObjects
  def cadastro
    Cadastro.new
  end
end
