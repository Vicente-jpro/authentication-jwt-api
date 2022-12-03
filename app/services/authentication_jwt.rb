require 'jwt'

class AuthenticationJwt
    attr_accessor :token, :decoded_token
    EXP = Time.now.to_i - 10
    LEEWAY = 30 # seconds
    
    def initialize(info, password)
        exp_payload = { data: info, exp: EXP }

        @token = JWT.encode exp_payload, password, 'HS256'

        begin
            @decoded_token = JWT.decode token, password, true, 
            {exp_leeway: LEEWAY, algorithm: 'HS256' }
        rescue JWT::ExpiredSignature
            "Token has expired"
        end
    end    

end