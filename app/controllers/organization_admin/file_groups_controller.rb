class OrganizationAdmin::FileGroupsController < OrganizationAdmin::AdminController
  before_action :set_file_group, only: [:show, :edit, :update, :destroy]

  def index
    @file_groups = FileGroup.all
  end

  def show
  end

  def new
    @file_group = FileGroup.new
  end


  def edit
  end

  def create
    @file_group = FileGroup.new(file_group_params)
      if @file_group.save
         redirect_to organization_admin_file_groups_path, notice: 'File group was successfully created.'
      else
         render :new
      end
  end

  def update
      if @file_group.update(file_group_params)
         redirect_to organization_admin_file_groups_path, notice: 'File group was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @file_group.destroy

    redirect_to organization_admin_file_groups_path, notice: 'File group was successfully destroyed.'

  end

  private
    def set_file_group
      @file_group = FileGroup.find(params[:id])
    end

    def file_group_params
      params.require(:file_group).permit(:name, :description, :position)
    end

end
