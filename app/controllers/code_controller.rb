class CodeController < ApplicationController
  def index
    @result = Code.all
    @count = Code.count
  end

  def new
    @code = Code.new
  end

  def create
    Code.create(code_params)
    redirect_to code_index_path
  end

  def destroy #I know this is working, I just forgot what to do when it closes
    @result = Code.all
    @result.destroy_all
    redirect_to code_index_path
  end

  def edit
    @code = Code.find(params[:id])
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
