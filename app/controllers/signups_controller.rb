class SignupsController < ApplicationController
  skip_before_action:authorize
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = 'User saved successfully'
        format.html { redirect_to login_url}# get call to user which means user/index
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :gender)
  end
end
