class PostsController < ApplicationController
  
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate, except: [ :index ]

  def create
    password = "12345"
    exp_payload = { data: info, exp: EXP }

    @token = JWT.encode exp_payload, password, 'HS256'
    
    render json: {token: @token, decoded_token: @decoded_token}
  end
  
  def show
  end

  def index
  end

  private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        password = "12345"
        begin
          @decoded_token = JWT.decode token, password, true, 
          {exp_leeway: LEEWAY, algorithm: 'HS256' }
        rescue JWT::ExpiredSignature
          @decoded_token = "Token has expired"
        end
       
      end
    end

end
