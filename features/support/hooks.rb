def tirar_foto(nome_arquivo)
  caminho = "reports/"
  foto = "#{caminho}/#{nome_arquivo}.png"
  page.save_screenshot(foto)
  embed(foto, 'image/png', 'Evidencias aqui!')
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
  tirar_foto(scenario_name) 
end
