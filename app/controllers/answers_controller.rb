class AnswersController < ApplicationController

  def create
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = Control.find(params[:control_id])

    unless OrienteeringUser.where(user_id: current_user.id, orienteering_id: @orienteering.id).present?
      ouser = OrienteeringUser.new(user_id: current_user.id, orienteering_id: @orienteering.id)
      ouser.save
    end

    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to orienteering_path(params[:orienteering_id]), notice: "Answer was saved."
    else
      render "controls/show"
    end
  end

  def update
    @orienteering = Orienteering.find(params[:orienteering_id])
    @control = Control.find(params[:control_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to orienteering_path(params[:orienteering_id]), notice: "Answer was updated."
    else
      render "controls/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer).merge(control_id: params[:control_id], user_id: current_user.id)
  end

end
