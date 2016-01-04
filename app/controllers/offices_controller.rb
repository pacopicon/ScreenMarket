class OfficesController < ApplicationController
  def show
    @office = Office.find(params[:id])
    @users = User.group(office: "#{@office.name}")
  end

  def create
    @office = Office.build(office_params)

    if @office.save
      flash[:notice] = "Success!"
    else
      flash[:error] = "There was an error creating the menu.  Please try again!"
      render :new
    end
  end

  def office_params
    params.require(:office).permit(:name)
  end
end
