class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :edit, :update, :destroy]
  def index
    @todos = Todo.all
  end

  def show
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render 'edit'
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    binding.pry
    @todo.destroy
    redirect_to todos_path
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :description, :complete)
    end

    def find_todo
      @todo = Todo.find(params[:id])
    end
end
