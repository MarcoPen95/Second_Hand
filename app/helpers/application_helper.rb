module ApplicationHelper

    def stripe_url
        "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['stripe_connect_client_id']}&scope=read_write"
    end

    def stripe_connect_button
        link_to stripe_url, class: "btn-stripe-connect" do
            content_tag :span, "connect with Stripe"
        end
    end


end
