class LoginPage
    include Capybara::DSL

    def go
        visit '/'
    end 
    
    def click_login
        find('a[class="active"]').click
    end

    def with(email, senha)
        find('input[id="authEmail"]').set email
        find('input[id="authPass"]').set senha
        click_button "Entrar"
    end


    def nome
        find('p[class="ng-binding"]').text
    end
    
end