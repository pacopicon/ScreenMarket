class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  after_create :update_office
  # This method is only good for seeding.  In a live version of this app, all vendors would declare their office upon registration.
  def update_office
    if field_of_exp == "Certified Professional Accountant" || field_of_exp == "Certified Financial Advisor" || field_of_exp == "Tax Attorney"
      office = "Finance office"
    elsif field_of_exp == "Nurse" || field_of_exp == "Nutritionist" || field_of_exp == "Podiatrist"
      office = "Health office"
    elsif field_of_exp == "Attorney-at-law" || field_of_exp == "Tax Attorney"
      office = "Legal office"
    elsif field_of_exp == "Russian language instructor" || field_of_exp == "Arabic language instructor" || field_of_exp == "Spanish language instructor" || field_of_exp == "French language instructor" || field_of_exp == "AP Calculus Teacher"
      office = "Education office"
    else
      office = "Tech office"
    end
    update_attribute(:office, office)
  end

  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments
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
    params.require(:user).permit(:name, :avatar, :vendor, :client)
  end
end
