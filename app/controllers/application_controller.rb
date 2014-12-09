class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  protect_from_forgery with: :null_session

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      Apikey.exists?(access_token: token)
    end
  end

  def request_http_token_authentication(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    self.__send__ :render, :json => { :error => "HTTP Token: Access denied. You did not provide an valid API key." }.to_json, :status => :unauthorized
  end
=======
  protect_from_forgery with: :exception


  private
    def current_user
      @_current_user ||= session[:current_house_id] &&
        House.find_by(id: session[:current_house_id])
    end

    def logged_in!
      redirect_to "/log_in" unless current_user
    end

    helper_method :current_user
>>>>>>> e69cc23fa9908ce52e526e265dc2367b13d7503b

end
