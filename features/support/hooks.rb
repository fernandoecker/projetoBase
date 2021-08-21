require 'report_builder'
require 'date'

Before do
    @login = LoginPage.new
    #page.driver.browser.manager..window.maximize
    page.current_window.resize_to(1440, 900)
end

Before("@login") do
    user = CONFIG["users"]["cat_menager"]
    @login.go
    @login.with(user["email"], user["pass"])
end

After do
    temp_shot = page.save_screenshot("log/temp_shot.png")
    screenshot = Base64.encode64(File.open(temp_shot,'rb').read)
    #screenshot = File.read(temp_shot, 'rb')
    #embed(screenshot, "image/png", "Screenshot")
    attach(screenshot, "image/png")
end

d = DateTime.now
@current_date = d.to_s.tr(":", "-")

at_exit do
    ReportBuilder.configure do |config|
        config.input_path = 'log/report.json'
        config.report_path = 'log/report_' + @current_date 
        config.report_types = [:html]
        config.report_title = 'Teste'
        config.compress_image = true
        config.additional_info = {browser: '', 'Data de Execução' => @current_date }
        config.color = "indigo"
    end
    ReportBuilder.build_report
end  