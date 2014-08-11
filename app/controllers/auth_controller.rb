class AuthController < ApplicationController
  # auth callback POST comes from Steam so we can't attach CSRF token
  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  def auth_callback
    auth = request.env['omniauth.auth']
    user = User.find_by(uid: auth.uid)
    if user
      sign_in user
    else
      new_user = User.new(uid: auth.uid, nick: auth.info['nickname'], profile: auth.info['urls']['Profile'], avatar: auth.info['image'], location: auth.info['location'])
      new_user.save
      sign_in new_user
    end
    redirect_to root_url
  end

  def sign_out
    log_off
    redirect_to root_url
  end
end
