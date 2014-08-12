class AuthController < ApplicationController
  # auth callback POST comes from Steam so we can't attach CSRF token
  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  def auth_callback
    auth = request.env['omniauth.auth']
    user = User.find_by(uid: auth.uid)
    if user
      sign_in user
      if user.update_attributes(nick: auth.info['nickname'], steam_url: auth.info['urls']['Profile'], avatar: auth.info['image'])
        flash[:alert] = 'User info synced with Steam'
      else
        flash[:alert] = 'Unable to sync user info with Steam'
      end
      flash[:success] = 'Signed in'
      redirect_back_or(root_path)
    else
      new_user = User.new(uid: auth.uid, nick: auth.info['nickname'], steam_url: auth.info['urls']['Profile'], avatar: auth.info['image'])
      if new_user.save
        sign_in new_user
        flash[:success] = 'Signed in'
        redirect_to user_path(new_user)
      else
        flash[:error] = 'Unable to sign in'
        redirect_to root_path
      end
    end
  end

  def sign_out
    log_off
    flash[:success] = 'Signed out'
    redirect_to root_url
  end
end
