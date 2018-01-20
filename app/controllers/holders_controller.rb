class HoldersController < ApplicationController
  def new
    @holder = Holder.new
  end

  def create
    @holder = Holder.new(holder_params)

    if @holder.save
      sessions[:holder_id] = @holder.id
      flash[:notice] = "Your profile was created."
      redirect_to holder_path(@holder)
    else
      render :new
    end
  end

  def show
    @holder = Holder.find params[:id]
  end

  private

  def holder_params
    params.require(:holder).permit(:name, :password, :password_confirmation)
  end
end
