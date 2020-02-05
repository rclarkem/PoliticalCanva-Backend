class ApplicationController < ActionController::API   
   
    private


def create_token(user_id)
    JWT.encode({user_id: user_id }, hmac_secret,"HS256")
end

def hmac_secret
    ENV["HMAC_SECRET"]
end

def logged_in_user_decoded
    begin
        token = request.headers["Authorization"]
        decoded = JWT.decode(token, hmac_secret, true, {algorithm: 'HS256'})
        decoded.first["user_id"]
    rescue
        nil        
    end
end



def valid_token?
     !!logged_in_user_decoded
end

 def require_login
    render json: {error: 'Unauthorized'}, status: :unauthorized if !valid_token?
  end

end
