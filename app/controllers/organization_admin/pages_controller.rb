class OrganizationAdmin::PagesController < OrganizationAdmin::AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end


  def edit
  end

  def create
    @page = Page.new(page_params)
      if @page.save
         redirect_to organization_admin_pages_path, notice: 'Page was successfully created.'
      else
         render :new
      end
  end

  def update
      if @page.update(page_params)
         redirect_to organization_admin_pages_path, notice: 'Page was successfully updated.'
      else
       pp @page.errors.full_messages
       render :edit
      end
  end

  def destroy
    @page.destroy

    redirect_to organization_admin_pages_path, notice: 'Page was successfully destroyed.'

  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :body, :description, :visible, :position, :url, *Page.globalize_attribute_names)
    end
end
