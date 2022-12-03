require 'jwt'

class AuthenticationJwt
    attr_accessor :payload, :token, :decoded_token
    
    def initialize(payload, password)
        @token = JWT.encode payload, password, 'HS256'
        @decoded_token = JWT.decode token, password, true, { algorithm: 'HS256' }
    end    

end