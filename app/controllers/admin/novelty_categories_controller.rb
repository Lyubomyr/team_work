class Admin::NoveltyCategoriesController < ApplicationController
  before_action :set_novelty_category, only: [:destroy, :update]

  def create
    @novelty_category= NoveltyCategory.new(novelty_category_params)
      if @novelty_category.save
         redirect_to new_admin_novelty_path, notice: 'Novelties_category was successfully created.'
      else
      flash[:alert] = 'Error fill the form'
      redirect_to new_admin_novelty_path
      end
  end

respond_to :html, :json
  def update
      if @novelty_category.update(novelty_category_params)
         respond_with @novelty_category
      else
       render :edit
      end
  end

  def destroy
    @novelty_category.destroy
    redirect_to new_admin_novelty_path
  end

  private
    def set_novelty_category
      @novelty_category = NoveltyCategory.find(params[:id])
    end

    def novelty_category_params
      params.require(:novelty_category).permit( :name, :color)
    end
end
