class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end
end
