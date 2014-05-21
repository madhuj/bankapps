

class UsersController < ApplicationController
  
  def new
     # @users = User.all
    @user = User.new
  end

def show
    @user = current_user
  end



  
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
    redirect_to articles_path, :notice => "Signed up!"
    else
      render 'new'
    end
  end


def twitter_login
 omniauth = request.env['omniauth.auth']   # This contains all the details of the user say Email, Name, Age so that you can store it in your application db.
    redirect_to "welcome_index"
  end



   private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

