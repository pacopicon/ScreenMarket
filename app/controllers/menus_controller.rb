class MenusController < ApplicationController

  def create
    @menu = Menu.build(menu_params)

    if @menu.save
      flash[:notice] = "Success!"
    else
      flash[:error] = "There was an error creating the menu.  Please try again!"
      render :new
    end
  end

  def index
    @menu = Menu.first
    @offices = Office.all
    @users = User.all
    @appointments = Appointment.all
  end

  def menu_params
    params.require(:menu).permit(:name)
  end

end
