class UsersController < ApplicationController
filter_access_to :all
  def index
   @user = User.all
  end

  def new
 @user = User.new
  end

  def create
    @user = User.new(params[:user])    
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to root_url, :notice => 'User was successfully created.'
    else
      render :action => "new"
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

      if @user.update_attributes(params[:user])
        redirect_to @user, :notice => 'User was successfully updated.'
      else
        render :action => "edit"
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
