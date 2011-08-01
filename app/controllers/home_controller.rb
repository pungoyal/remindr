class HomeController < ApplicationController
  def index
  end

  def r
    @separator = ' | '
    @name = "Puneet Goyal"
    @role = "Agile Coach, Application Developer"
    @email = "email@puneetgoyal.net"
    render :layout => 'r'
  end
end
