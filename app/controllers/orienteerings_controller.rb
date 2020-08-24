class OrienteeringsController < ApplicationController

  def index
    @orienteerings = Orienteering.all.order(created_at: "DESC")
  end

  def show
    @orienteering = Orienteering.find(params[:id])
    @controls = @orienteering.controls
    set_latlng(@controls)
  end

  def new
    @orienteering = Orienteering.new
  end

  def edit
    @orienteering = Orienteering.find(params[:id])
  end

  def create
    @orienteering = Orienteering.new(orienteering_params)
    if @orienteering.save
      redirect_to root_path, notice: "Orienteering was created."
    else
      render :new
    end
  end

  def update
    @orienteering = Orienteering.find(params[:id])
    if @orienteering.update(orienteering_params)
      redirect_to root_path, notice: "Orienteering was updated."
    else
      render :edit
    end
  end

  def result
    @orienteering = Orienteering.find(params[:id])
    @controls = @orienteering.controls.includes(:answers)
    @users = @orienteering.users
    @array_user_scores = @orienteering.calc_scores
  end

  private

  def orienteering_params
    params.require(:orienteering).permit(:name).merge(host_id: current_user.id)
  end

  def set_latlng(controls)
    if controls.present?
      @lat = controls.first.position_lat
      @lng = controls.first.position_lng
    else # tokyo sta.
      @lat = 35.6812584  
      @lng = 139.7667767
    end

    @array_lats = []
    @array_lngs = []
    controls.each do |control|
      @array_lats << control.position_lat
      @array_lngs << control.position_lng
    end
  end

end
