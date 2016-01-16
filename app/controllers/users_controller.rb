class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user_on_page = User.find(params[:id])
    @visiting_user = current_user
    @customer_appointments = @user_on_page.customer_appointments
    @vendor_appointments = @user_on_page.vendor_appointments
    @appointments = @customer_appointments + @vendor_appointments
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def at_least_one_or_empty(instance_var)
    if instance_var.nil?
      instance_var.none
    else
      instance_var.find(params[:id])
    end
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :field_of_exp, :office_id, :role,)
  end
end
