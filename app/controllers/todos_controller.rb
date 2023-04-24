class TodosController < ApplicationController
  before_action :set_todo, only: %i[destroy]

  def index
    @todos = Todo.all.order(id: :asc)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params_required)

    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    if @todo.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def params_required
    params.require(:todo).permit(:description)
  end
end
