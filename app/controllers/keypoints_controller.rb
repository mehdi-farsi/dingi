class KeypointsController < ApplicationController
  before_action :set_concept

  def create
    @concept.keypoints.create(keypoint_params)
    redirect_to @concept
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_concept
    @concept = Concept.find_or_create_by(id: params[:id] || params[:concept_id])
  end

  def keypoint_params
    params.require(:keypoint).permit(:content)
  end
end