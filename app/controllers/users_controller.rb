class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :userlogin
  before_action :authorizemanager                                                                                       #Autorisierung 1. Login, 2. Manager
  #before_action :authorize, :only => [:show] #funktioniert noch nicht


  # GET /users
  # GET /users.json
  def index
    @users = User.all
   # authorize! :read, User
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
      redirect_to users_path, notice: 'Mitarbeiter wurde registriert.'

      # Sendet email
      AnmeldungsMailer.anmeldungs_email(@user).deliver
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Mitarbeiterdaten wurden geändert.' }
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
      format.html { redirect_to users_url, notice: 'Mitarbeiter wurde gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:vorname, :nachname, :email, :rechte, :password, :password_confirmation)
    end
end
