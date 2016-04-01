class CodeController < ApplicationController
  def index
    @resultOrig = Code.all
    @result = Code.all.paginate(:page => params[:page], :per_page => 8)
    @count = Code.count
    @name = current_user.name
    @counter = 1 + (@result.current_page-1)*8
  end

  def new
    @code = Code.new
    @kinds = ["Line", "Block", "Full Program"]
    @languages = ["Java", "JavaScript", "Ruby", "Pascal", "Swift", "HTML", "CSS"]
  end

  def create
    @code = Code.create(code_params)
    @code.user = current_user
    @code.save
    redirect_to code_index_path
  end

  def show
    @code = Code.find(params[:id])
    @user = @code.user
  end

  def destroy
    @result = Code.all
    @result.destroy_all
    redirect_to code_index_path
  end

  def edit
    @code = Code.find(params[:id])
    @kinds = ["Line", "Block", "Full Program"]
    @languages = ["Java", "JavaScript", "Ruby", "Pascal", "Swift", "HTML", "CSS"]
  end

  def update
    @code = Code.find(params[:id])
    @code.update_attributes(code_params)
    redirect_to code_index_path(@result)
  end

  private

  def code_params
    params.require(:code).permit(:kind, :language, :purpose, :content)
  end
end
