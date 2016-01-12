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
    @appointment = Appointment.new
    authorize @appointment
  end

  def new
    @vendor = User.find(params[:user_id])
    @customer = current_user
    @appointment = Appointment.new
    authorize @appointment
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

  def user_params
    params.require(:user).permit(:name, :avatar, :field_of_exp, :office_id, :role,)
  end
end
