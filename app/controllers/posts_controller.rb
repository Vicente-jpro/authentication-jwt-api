class PostsController < ApplicationController
  
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, except: [ :index, :create ]

  def create
    
    password = "12345"
    exp_payload = { data: params[:data], exp: Time.now.to_i + 30 }
  
    @token = JWT.encode exp_payload, password, 'HS256'
    
    render json: { token: @token }
  end
  
  def show
    render json: {message: "Acessou o show"}
  end

  def index
  end

  private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
  
        leeway = 30 # seconds
        password = "12345"
        #begin
          @decoded_token = JWT.decode token, password, true, 
          {exp_leeway: leeway, algorithm: 'HS256' }
        #rescue JWT::ExpiredSignature
         # @decoded_token = "Token has expired"
        #end
       
      end
    end

end
