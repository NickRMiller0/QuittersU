class SessionsController < ApplicationController

  def new
    # Redirect to the Google URL
    redirect_to login_url.to_s
  end 

  def create
    # Get user tokens from GoogleHelper
    user_tokens = get_tokens(params[:code])

    # Get the username from Google
    user_info = call_api('/oauth2/v2/userinfo', user_tokens['access_token'])   

    # Get the user, if they exist
    user = User.where(:uid => user_info['id']).first

    # Create the user if they don't exist
      if(user == nil)
        user = User.create(:email => user_info['email'],
     :first_name => user_info['given_name'], :last_name => user_info['family_name'], :role => 'User', :uid => user_info['id'], :refresh_token => user_tokens['refresh_token'], :access_token => user_tokens['access_token'], :expires => user_tokens['expires_in'])
        session[:user_id] = user.id
      end

      # Else update their info and save
      else
        user.refresh_token = user_tokens['refresh_token']
        user.access_token = user_tokens['access_token']
        user.expires = user_tokens['expires']
        user.save

        session[:user_id] = user.id
      end
    # Redirect home
    redirect_to session[:redirect_to] ||= root_path    
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end