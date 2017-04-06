class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception                                                                                 #Schutz vor Hacking durch verify_authenticity_token

  #definiert, ob ein Nutzer eingeloggt ist oder nicht
  private
  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def userlogin
    if current_user.nil?
      redirect_to root_path                                                                                             #falls nicht eingeloggt
    else
    end
  end

  def authorizemanager
    if current_user.rechte != "Manager"                                                                                 #falls reche nicht manager
      redirect_to starta_path, notice: "Not authorized! Only manager has access to this post."                          #leite weiter auf start
    end
  end

  def authorize
    if current_user.id == 1
      redirect_to root_path, notice: "Not authorized! Only manager has access to this post."
    end
  end
end