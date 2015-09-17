class ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :edit, :update, :destroy]

  # GET /concepts
  # GET /concepts.json
  def index
    @concepts = Concept.all
  end

  # GET /concepts/1
  # GET /concepts/1.json
  def show
    @keypoints = @concept.keypoints
  end

  # GET /concepts/new
  def new
    @concept = Concept.create
    redirect_to @concept 
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts
  # POST /concepts.json
  def create
    @concept = Concept.new(concept_params.except(:keypoint_1, :keypoint_2))
    @concept.keypoints.build(name: concept_params[:keypoint_1]) if concept_params[:keypoint_1]
    @concept.keypoints.build(name: concept_params[:keypoint_2]) if concept_params[:keypoint_w]
    respond_to do |format|
      if @concept.save
        format.html { redirect_to @concept, notice: 'Concept was successfully created.' }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1
  # PATCH/PUT /concepts/1.json
  def update
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to @concept, notice: 'Concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1
  # DELETE /concepts/1.json
  def destroy
    @concept.destroy
    respond_to do |format|
      format.html { redirect_to concepts_url, notice: 'Concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.find_or_create_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_params
      params.require(:concept).permit(:name, :definition, :keypoint_1, :keypoint_2)
    end
end
