
class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider]
     auth = request.env["omniauth.auth"]
     flash[:alert] = "you are successfully logged in"
     redirect_to articles_path 
   elsif user = User.authenticate(params[:email], params[:password]) 
    
    session[:user_id] = user.id  
    flash[:alert] = "you are successfully logged in"

    redirect_to articles_path 
  else  
    flash.now.alert = "Invalid email or password" 
    redirect_to articles_path 
  end  
end

  # def create
  #   if params[:provider]
  #     auth = request.env["omniauth.auth"]
  #   else
  #   user = User.authenticate(params[:email], params[:password])
  #  end
  #   if user
  #     session[:user_id] = user.id
  #     redirect_to new_article_path, :notice => "Logged in suceesfully!"
  #   else
  #     flash.now.alert = "Invalid email or password"
  #     render "new"
  #   end
  # end
  # def create
  #         if params[:provider] == "twitter"
  #         auth = request.env["omniauth.auth"]
  #         user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  #         session[:user_id] = user.id
  #         store_flash_message("Logged in Successfully", :notice)
  #         else
  #        store_flash_message("Logged out Successfully", :notice)
  #          render "new"
  #        end
  #        end





  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out suceesfully!"
  end


end

