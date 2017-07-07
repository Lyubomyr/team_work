class OrganizationAdmin::DocumentsController < OrganizationAdmin::AdminController

  def create
    @file_group = FileGroup.find(params[:file_group_id])
    @document = @file_group.documents.create(document_params)
    redirect_to organization_admin_file_group_path(@file_group)
  end

  private
    def document_params
      params.require(:document).permit(:name, :position)
    end

end
