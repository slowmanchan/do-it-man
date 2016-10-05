class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "New Task Added"
      redirect_to root_path
    else
      flash[:danger] = "error"
      render 'new'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:success] = "Task Removed!"
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
