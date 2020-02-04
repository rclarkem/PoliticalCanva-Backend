class LoginsController < ApplicationController
    def create
        @user = User.find_by_email(params[:email])
        byebug
        if @user && @user.authenticate(params[:password])
            render json: {token: create_token(@user.id)}
        else
            render json: {error: ["That does not match anyone"]}, status: :not_acceptable
        end
        
    end

end
