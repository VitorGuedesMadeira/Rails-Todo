class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]

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

  def update
    if @todo.update(params_required)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @todo.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def delete_completed
    @todos = Todo.where(completed: true)
    if @todos.destroy_all
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
    params.require(:todo).permit(:description, :completed)
  end
end
