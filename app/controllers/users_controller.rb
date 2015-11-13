class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]
  rescue_from ActionController::ParameterMissing, with: :invalid_avatar
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)   
      if @user.save
        UserMailer.registration(@user).deliver        
        redirect_to :root, notice: "Пользователь #{@user.name} был успешно создан."         
      else
         render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update 
     if @user.update(user_params)
    if params[:user][:avatar].blank?      
       redirect_to @user, notice: "Пользователь #{@user.name} был успешно обновлён."  
    else
      render :action => "crop"
    end
    else
      render :action => 'edit'
    end
  end

  def delete_attachment
    @user= User.find(params[:id])
    @user.avatar = nil
    @user.save
    redirect_to @user
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
      session[:user_id] = nil
      redirect_to :root, notice: 'Пользователь был успешно удалён!'          
  end

  private

    def invalid_avatar
      redirect_to @user, :alert => 'Выберите пожалуйста фотографию'  
     end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit!
    end
end
