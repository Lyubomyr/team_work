class OrganizationAdmin::DocumentsController < OrganizationAdmin::AdminController

  def create
    @file_group = FileGroup.find(params[:file_group_id])
    @document = @file_group.documents.create(document_params)
    redirect_to organization_admin_file_group_path(@file_group)

  # uploaded_io = params[:document][:file]
  #   File.open(Rails.root.join('public', 'assets', 'products', uploaded_io.original_filename), 'wb') do |f|
  #     f.write(uploaded_io.read)
  #   end
  # @document.file = uploaded_io.original_filename

  end

  def show
    @file_group = FileGroup.find(params[:file_group_id])
    @document = Document.find(params[:id])
    extension = @document.file.to_s.split('.')
      send_file Rails.root.join('public', 'assets', 'products', @document.file), :type => "application/#{extension[1]}", :x_sendfile=>true
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
