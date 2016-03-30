class CodeController < ApplicationController
  def index
    @result = Code.all
    @count = Code.count
    @name = current_user.name
    @counter = 1
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

  def destroy #I know this is working, I just forgot what to do when it closes
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
