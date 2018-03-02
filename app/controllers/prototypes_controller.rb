class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.all.page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new(create_params)
    4.times { @prototype.thumbnails.build }
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy if prototype.user_id == current_user.id
    redirect_to :root, notice: 'Prototype was successfully deleted.'
  end

  private

    def create_params
      params.require(:prototype).permit(thumbnails_attributes: [:image])

    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    def prototype_params
      params.require(:prototype).permit(
        :title,
        :catch_copy,
        :concept,
        :user_id,
        captured_images_attributes: [:content, :status]
      )
    end
  end
end
