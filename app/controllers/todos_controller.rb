class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  def new
    @todo = Todo.new
  end

  def create
    if @todo.save
      flash[:notice] = "Todo was created successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def index
    @todos = Todo.all
  end

  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"

    redirect_to todos_path
  end

  def update
    if @todo.update_attributes(todo_params)
      flash[:notice] = "Todo successfully updated"
      redirect_to @todo
    else
      render "update"
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
