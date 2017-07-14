class OrganizationAdmin::DocumentsController < OrganizationAdmin::AdminController
  before_action :set_document, only: [:edit, :update, :destroy]


  def create
    @file_group = FileGroup.find(params[:file_group_id])
    if @document = @file_group.documents.create(document_params)
      redirect_to organization_admin_file_group_path(@file_group), notice: 'Document was successfully created.'
    else
      redirect_to organization_admin_file_group_path(@file_group), notice: 'Document was not successfully deleted.'
    end
  end

  def edit

  end

  def update
    if @document.update(document_params)
      redirect_to organization_admin_file_group_path(@file_group), notice: 'Document was successfully updated.'
    else
     render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to organization_admin_file_group_path(@file_group), notice: 'Document was successfully deleted.'
  end


  private

    def set_document
    @file_group = FileGroup.find(params[:file_group_id])
    @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:name, :file, :position)
    end

end
