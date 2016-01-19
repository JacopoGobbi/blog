class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :show, :edit, :update, :destroy]
  before_action :set_logged_user, only: [:follow, :show]

  # GET /users
  # GET /users.json
  def follow
    if @logged_user.following?(@user)
      @logged_user.unfollow(@user)
    else
      @logged_user.follow(@user)
    end
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def index
    unless session?
      flash[:danger] = "Login please."
      redirect_to root_path
    end
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @posts = Post.where(user_id: @user.id)
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

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_logged_user
      @logged_user = User.find(session[:user_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :password_digest)
    end
end
