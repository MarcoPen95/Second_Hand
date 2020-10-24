class ExampleMailer < ApplicationMailer


  def sample_email(buyer)
    @user = buyer
    mg_client = Mailgun::Client.new ENV['mailgun_apikey']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => buyer.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'Albanesi tutti appesi(Juve Merda)'}
    mg_client.send_message ENV['domain'], message_params
  end
