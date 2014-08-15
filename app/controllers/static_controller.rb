class StaticController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def denied
  end

  def goodbye
  end

  def lft
  end

  def lfp
  end

  # TODO: delete this when back online
  def tmp_login
    sign_in User.find_by(nick: "~{PA}~ Clyph0rd")
    redirect_back_or(root_path)
  end
end
