  Quando('eu faço login com {string} e {string}') do |email, senha|
    @login.go
    @login.click_login
    @login.with(email, senha)
  end
  
  
  Então('devo ver {string} na area logada') do |nome|
    expect(@login.nome).to eql nome
  end

