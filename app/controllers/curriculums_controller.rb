class CurriculumsController < ApiController
  before_action :set_curriculum, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @curriculums = Curriculum.all
    respond_with(@curriculums)
  end

  def show
    respond_with(@curriculum)
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    flash[:notice] = 'Curriculum was successfully created.' if @curriculum.save
    respond_with(@curriculum)
  end

  def update
    flash[:notice] = 'Curriculum was successfully updated.' if @curriculum.update(curriculum_params)
    respond_with(@curriculum)
  end

  def destroy
    @curriculum.destroy
    respond_with(@curriculum)
  end

  private
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    def curriculum_params
      params.require(:curriculum).permit(:title, :description, :steps, :source)
    end
end
