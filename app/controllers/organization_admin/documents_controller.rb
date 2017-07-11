class OrganizationAdmin::DocumentsController < OrganizationAdmin::AdminController

  def create
    @file_group = FileGroup.find(params[:file_group_id])
    @document = @file_group.documents.create(document_params)
    redirect_to organization_admin_file_group_path(@file_group)
  end

  def destroy
    @file_group = FileGroup.find(params[:file_group_id])
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to organization_admin_file_group_path(@file_group), notice: 'Document was successfully deleted.'
  end


  private
    def document_params
      params.require(:document).permit(:name, :file, :position)
    end

end
