class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def show
    @list = List.find params[:id]
  end
end