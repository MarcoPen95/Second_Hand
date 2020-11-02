class ExampleMailer < ApplicationMailer


  def sample_email(buyer)
    @email = buyer.email
    mg_client = Mailgun::Client.new ENV['mailgun_apikey']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @email,
                      :subject => 'Order information',
                      :text    => 'Your order has been sent'}
    mg_client.send_message ENV['domain'], message_params
  end
end