class ControlsController < ApplicationController

  def new
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = @orienteering.controls.new
  end

  def show
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = Control.find(params[:id])

    if Answer.where(user_id: current_user.id, control_id: @control.id).present?
      @answer = Answer.find_by(user_id: current_user.id, control_id: @control.id)
    else
      @answer = Answer.new
    end
  end

  def edit
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = Control.find(params[:id])
  end

  def create
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = @orienteering.controls.new(control_params)
    if @control.save
      redirect_to orienteering_path(@orienteering.id), notice: "Control was created."
    else
      render :new
    end
  end

  def update
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = Control.find(params[:id])
    if @control.update(control_params)
      redirect_to orienteering_path(@orienteering.id), notice: "Control was updated."
    else
      render :edit
    end
  end

  private

  def control_params
    params.require(:control).permit(:name, :question, :choice, :answer, :position_lat, :position_lng, :point)
  end

end
