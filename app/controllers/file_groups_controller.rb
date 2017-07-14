class FileGroupsController < ApplicationController

before_action :set_file_group, only: [:show]

  def index
    @file_groups = FileGroup.all
  end

  def show
  end

  private
    def set_file_group
      @file_group = FileGroup.find(params[:id])
    end

    def file_group_params
      params.require(:file_group).permit(:name, :description, :position)
    end

end
