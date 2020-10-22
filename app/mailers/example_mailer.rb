class ExampleMailer < ApplicationMailer


  def sample_email(buyer)
    @user = buyer
    mg_client = Mailgun::Client.new ENV['mailgun_apikey']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => 'pennyflash.95@gmail.com',
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end