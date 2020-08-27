class ControlsController < ApplicationController

  before_action :set_orienteering, only: [:new, :show, :edit, :create, :update]
  before_action :check_curernt_user, only: [:new, :edit]

  def new
    @control = @orienteering.controls.new
    control_last = @orienteering.controls.order(id: "DESC").limit(1)
    set_latlng_zoomflag(control_last[0])
  end

  def show
    @control = Control.find(params[:id])

    if Answer.where(user_id: current_user.id, control_id: @control.id).present?
      @answer = Answer.find_by(user_id: current_user.id, control_id: @control.id)
    else
      @answer = Answer.new
    end
  end

  def edit
    @control = Control.find(params[:id])
  end

  def create
    @control = @orienteering.controls.new(control_params)
    if @control.save
      redirect_to orienteering_path(@orienteering.id), notice: "Control was created."
    else
      control_last = @orienteering.controls.order(id: "DESC").limit(1)
      set_latlng_zoomflag(control_last[0])
      render :new
    end
  end

  def update
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

  def set_orienteering
    @orienteering = Orienteering.find(params[:orienteering_id])
  end

  def check_curernt_user
    unless @orienteering.host_id == current_user.id
      redirect_to orienteering_path(@orienteering.id), notice: "You don\'t have access authority."
    end
  end

  def set_latlng_zoomflag(control_last)
    if control_last.present?
      @lat = control_last.position_lat
      @lng = control_last.position_lng
      @zoomflag = 1
    else # tokyo sta.
      @lat = 35.6812584  
      @lng = 139.7667767
      @zoomflag = 0
    end
  end

end
