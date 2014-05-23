
class SessionsController < ApplicationController

  def new
  end


  def create
    if params[:provider]
     auth = request.env["omniauth.auth"]
     user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
     session[:user_id] = user.id 
     flash[:alert] = "you are successfully logged in"
     redirect_to articles_url 
   elsif
    user = User.authenticate(params[:email], params[:password]) 
    session[:user_id] = user.id  
    flash[:alert] = "you are successfully logged in"
    redirect_to articles_path
  else  
    flash.now.alert = "Invalid email or password" 
    redirect_to articles_path 
  end 
end


def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out suceesfully!"
end


end

