class OrienteeringsController < ApplicationController

  before_action :set_orienteering, only: [:show, :edit, :update, :result]
  before_action :check_curernt_user, only: [:edit, :result]

  def index
    @orienteerings = Orienteering.where('opendate_at <= ?', Time.current).or(Orienteering.where(host_id: current_user.id)).order(created_at: "DESC")
  end

  def show
    @controls = @orienteering.controls
    set_latlng(@controls)
  end

  def new
    @orienteering = Orienteering.new
  end

  def edit
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
    if @orienteering.update(orienteering_params)
      redirect_to root_path, notice: "Orienteering was updated."
    else
      render :edit
    end
  end

  def result
    @controls = @orienteering.controls.includes(:answers)
    @users = @orienteering.users
    @array_user_scores = @orienteering.calc_scores
  end

  private

  def orienteering_params
    params.require(:orienteering).permit(:name, :opendate_at).merge(host_id: current_user.id)
  end

  def set_orienteering
    @orienteering = Orienteering.find(params[:id])
  end

  def check_curernt_user
    unless @orienteering.host_id == current_user.id
      redirect_to root_path, notice: "You don\'t have access authority."
    end
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
