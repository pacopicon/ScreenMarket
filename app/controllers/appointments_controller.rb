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
   	@appointment = current_user.appointments.find(params[:id])
    authorize @appointment

		if @appointment.destroy
  		flash[:notice] = "The appointment was obliterated!"
  	else
     	flash[:notice] = "Oops!, the appointment could not be deleted.  Try again!"
		end

		respond_to do |format|
   		format.html
  		format.js
 		end
  end

  def new
    @vendor = User.find(params[:user_id])
    @customer = current_user
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
 		@user = current_user
    @appointment = current_user.appointments.build(appointment_params)
		@new_appointment = Appointment.new
    authorize @appointment

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
		params.require(:appointment).permit(:name, :time_of, :amount, :has_been_paid)
 	end

    end
