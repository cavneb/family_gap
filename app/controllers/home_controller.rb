class HomeController < ApplicationController

  def index
    if current_user && current_user.access_token
      @client = FsClient.new(current_user.access_token)
      @me = @client.current_person
      @ancestry = @client.ancestry(@me.personId)
      byebug
    end
  end

end
