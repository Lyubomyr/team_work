class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  # GET /comments
  def index
    @comments = Comment.order(sort_column + " " + sort_direction)
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params) # Comment.new(project_id: 2)
    if @comment.save
      redirect_to @project, notice: 'Comment was successfully created.'
    else
      redirect_to @project, notice: '!!! ERROR  !!! ----->Not created fill the form <--------'
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy

           redirect_to  @project = Project.find(params[:project_id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text)
    end


end
