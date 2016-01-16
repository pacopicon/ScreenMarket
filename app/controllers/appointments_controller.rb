class AppointmentsController < ApplicationController

  def show
  	@user = current_user
		@appointment = current_user.appointments.find(params[:id])
  	@appointments = current_user.appointments

		respond_to do |format|
  		format.html
	    format.js
 	 	end
  end

	def destroy
   	@appointment = current_user.customer_appointments.find(params[:id])
    authorize @appointment

		if @appointment.destroy
  		flash[:notice] = "The appointment has been canceled."
  	else
     	flash[:notice] = "For some reason, the appointment could not be deleted.  Please try again."
		end

		respond_to do |format|
   		format.html
  		format.js
 		end
  end

  # def new
  #   @vendor = User.find(params[:user_id])
  #   @customer = current_user
  #   @appointment = Appointment.new
  #   authorize @appointment
  # end

  def create
    @user_on_page = User.find(params[:user_id])
    @visiting_user = current_user
    @appointment = Appointment.new(appointment_params)
		@new_appointment = Appointment.new

  	if @appointment.save
  		flash[:notice] = "Success! appointment was saved!"
	 	else
  		flash[:error] = "Oops! Something went wrong. The appointment was not saved. Please try again!"
  	end

   	respond_to do |format|
   		format.html
			format.js
  	end
  end

	def update
    @user = current_user
		@appointment = Appointment.find(params[:id])
		if @appointment.update_attributes(appointment_params)
			flash[:notice] = “appointment has been updated.”
		else
			flash[:error] = “There was an error updating the appointment.  Please try again!”
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

  private

	def appointment_params
		params.require(:appointment).permit(:name, :time_of, :duration, :amount, :has_been_paid, :vendor_id, :customer_id)
 	end

    end
