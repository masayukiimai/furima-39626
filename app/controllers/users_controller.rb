
 class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def index
      @users = User.all
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: "User was successfully created."
      else
        render :new
      end
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: "User was successfully updated."
      else
        render :edit
      end
    end
  
    private
    
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :date_of_birth, :encrypted_password, :nickname)
    end
  end
  
  
  
  

