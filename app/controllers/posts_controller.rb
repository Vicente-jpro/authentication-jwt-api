class PostsController < ApplicationController
  
  def create
    @authentication = AuthenticationJwt.new(params[:data], params[:password])
    debugger
    render json: {token: @authentication.token, decoded_token: @authentication.decoded_token}
  end
  
  def show
  end

  def index
  end
end
