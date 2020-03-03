class UsersController < ApplicationController
# before_action :find_user, only: [:show, :edit, :update, :destroy]
before_action :require_login, only: [:index, :show, :delete, :update]

    def index
        users = User.all
        render json: users
    end



    def my_users
        if User.find(logged_in_user_decoded).is_admin?
          candidate_id = User.find(logged_in_user_decoded).candidate.id
          @users = User.where(candidate_id: candidate_id)
            render json: @users
        else
            render json: {error: 'Unauthorized'}, status: :unauthorized
        end
    end

    def create
          user = User.create(user_params)
          if user.valid?
            render json: {user: UserSerializer.new(user),token: create_token(user.id), admin: user.admin }
        else
            render json: {errors: user.errors.full_messages}, status: 400
        end
    end

    def not_admin_update
        user = User.find(params[:id])
        # byebug
        if !User.find(logged_in_user_decoded).is_admin?
            user.update(not_admin_params)
              render json: user.to_json
        end
    end


    def admin_update
         user = User.find(params[:id])
        #  byebug
        if User.find(logged_in_user_decoded).is_admin?
            user.update(user_params)
              render json: user.to_json
        end
    end

    def show
        user = User.find(params[:id])
        # byebug
        # user_id = params[:id]
        potential_admin = User.find(logged_in_user_decoded)
        # byebug
        if logged_in_user_decoded == user.id || potential_admin.is_admin? && user.candidate.id === potential_admin.candidate_id
            render json: user
         else
            render json: {error: 'Go Away!'}
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :email, :password, :admin, :candidate_id)
    end

    def not_admin_params
        params.permit(:first_name, :last_name, :username, :email, :password, :candidate_id)  
    end


end
