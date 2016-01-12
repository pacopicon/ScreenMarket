class OfficesController < ApplicationController

  def index
    @offices = Office.all
    @users = User.all
    @appointments = Appointment.all
  end

  def show
    @office = Office.find(params[:id])
    @users = User.where(office_id: @office.id)
  end

  def new
    @office = Office.new
    authorize @office
  end

  def edit
    @office = Office.find(params[:id])
    authorize @office
  end

  def update
    if @office.update_attributes(office_params)
      flash[:notice] = "Office has been updated"
      redirect_to edit_office_path
    else
      flash[:error] = "Office could not be updated"
      render :edit
    end
  end

  def create
    @office = Office.new(office_params)
    @new_office = Office.new

    authorize @office

    if @office.save
      flash[:notice] = "Success!"
    else
      flash[:error] = "There was an error creating the menu.  Please try again!"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @office = Office.find(params[:id])
    authorize @office

    if @office.destroy
      flash[:notice] = "\"#{@office.name}\" has successfully been deleted."
    else
      flash[:error] = "There was an error deleting this office. Please try again!"
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def office_params
    params.require(:office).permit(:name)
  end

end
