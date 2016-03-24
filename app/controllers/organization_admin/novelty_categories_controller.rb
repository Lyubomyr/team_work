class OrganizationAdmin::NoveltyCategoriesController < OrganizationAdmin::AdminController
  before_action :set_novelty_category, only: [:destroy, :update]

  def create
    @novelty_category= NoveltyCategory.new(novelty_category_params)
     if @novelty_category.save
        @novelty_categories = NoveltyCategory.all
        @select_options = @novelty_categories.map{|c| "<option style='color:#{c.color}' value='#{c.id}'>#{c.name}</option>"}.join(" ")
        respond_to do |format|
          format.js { render "organization_admin/novelties/create" }
        end
      else
      flash[:error] = 'Error fill the form'
      redirect_to new_organization_admin_novelty_path
    end
  end

  def update
      if @novelty_category.update(novelty_category_params)
        respond_to do |format|
          format.json { render json: @novelty_category }
        end
      else
       render :edit
      end
  end

  def destroy
    @novelty_category.destroy
    redirect_to new_organization_admin_novelty_path
  end

  private
    def set_novelty_category
      @novelty_category = NoveltyCategory.find(params[:id])
    end

    def novelty_category_params
      params.require(:novelty_category).permit( :name, :color)
    end
end
