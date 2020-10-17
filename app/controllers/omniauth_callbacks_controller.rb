class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def stripe_connect
        auth_data = request.env["omniauth.auth"]
        @seller = current_seller
        if @seller.persisted?
            @seller.provider = auth_data.provider
            @seller.uid = auth_data.uid
            @seller.access_code = auth_data.credentials.token
            @seller.publishable_key = auth_data.info.stripe_publishable_key
            @seller.save


            sign_in_and_redirect @seller, event: :authentication
            flash[:notice] = "Stripe Account created and Connected" if is_navigational_format?
        else
            session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
            redirect_to root_path
        end
    end


    def failure
        redirect_to root_path
        
    end
end
    