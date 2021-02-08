class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :index]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :find_user_company, only: [:show_user_from_company]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # Get all users from company
  def user_company
    @users_from_company = current_user.company.users

    render json: @users_from_company
  end


    # GET selected user from company
    def show_user_from_company
      render json: @user_by_company
    end



  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

       # looks for the user from company
       def find_user_company
        @user_by_company = current_user.company.users.where(id: params[:id])
      end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :email, :password, :user_name, :driver_license_number, 
         :driver_license_expiry, :company_id, :driver_id, :is_admin
      )
    end
end
