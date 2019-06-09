class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :update, :destroy, :create]

  # GET /arts
  def index
    #@arts = Art.all

    render json: @arts.to_json(include: :user)
  end

  # GET /arts/1
  def show
    render json: @art
  end

  # POST /arts
  def create
    @art = Art.new(art_params)

    @art.user_id = params[:user_id]

    if @art.save
      render json: @art, status: :created
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arts/1
  def update
    if @art.update(art_params)
      render json: @art
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  # DELETE /arts/1
  def destroy
    @art.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def art_params
      params.require(:art).permit(:title, :img, :description, :size, :style, :medium, :material)
    end
end
