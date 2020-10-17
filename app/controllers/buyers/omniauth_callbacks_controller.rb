# frozen_string_literal: true

class Buyers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
    def all
      buyer = Buyer.from_omniauth(request.env["omniauth.auth"])
      if buyer.persisted?
        session[:buyer_id] = buyer.id
        sign_in buyer, notice: "Signed in!"
        redirect_to root_path
      else
        # Devise allow us to save the attributes eventhough
        # we haven't create the user account yet
        session["devise.buyer_attributes"] = buyer.attributes
        redirect_to root_path
      end
    end
    alias_method :google_oauth2, :all
  
    # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
