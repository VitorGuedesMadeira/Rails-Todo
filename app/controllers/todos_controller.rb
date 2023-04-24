class TodosController < ApplicationController
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

  def destroy; end

  private

  def params_required
    params.require(:todo).permit(:description)
  end
end
