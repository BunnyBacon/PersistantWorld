class SharedController < ApplicationController
  def homepage
  	@user_session = UserSession.new
  	render :layout => "ginger/homepage"
  end

end
