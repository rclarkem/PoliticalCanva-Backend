class UsersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]
before_action :require_login

    def index
        if User.find(logged_in_user_decoded).is_admin?
          candidate_id = User.find(logged_in_user_decoded).candidate.id
          @users = User.where(candidate_id: candidate_id)
            render json: @users
        else
            render json: {error: 'Unauthorized'}, status: :unauthorized
        end
    end

    def create
          @user = User.create(user_params)
        if @user.valid?
            render json: @user, status: :created
        else
            render json: {errors: @user.errors.full_messages}, status: 400
        end
    end

    def show
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :admin, :candidate_id)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
