class FreelanceDocsController < ApplicationController
  before_action :set_freelance_doc, only: [:show, :update, :destroy]

  # GET /freelance_docs
  def index
    @freelance_docs = FreelanceDoc.all

    render json: @freelance_docs
  end

  # GET /freelance_docs/1
  def show
    render json: @freelance_doc
  end

  # POST /freelance_docs
  def create
    @freelance_doc = FreelanceDoc.new(freelance_doc_params)

    if @freelance_doc.save
      render json: @freelance_doc, status: :created, location: @freelance_doc
    else
      render json: @freelance_doc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /freelance_docs/1
  def update
    if @freelance_doc.update(freelance_doc_params)
      render json: @freelance_doc
    else
      render json: @freelance_doc.errors, status: :unprocessable_entity
    end
  end

  # DELETE /freelance_docs/1
  def destroy
    @freelance_doc.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelance_doc
      @freelance_doc = FreelanceDoc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def freelance_doc_params
      params.require(:freelance_doc).permit(:title, :description, :file_url, :image_url)
    end
end
