

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

 # def load_tweets
 #    @tweets = Twitter.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
 #  end
  
  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
end

