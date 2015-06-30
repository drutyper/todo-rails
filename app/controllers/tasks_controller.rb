class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def complete
      task = Task.find params[:task_id]
      task.toggle_complete!
      render json: { status: :ok }
  end

  def create
    # Task.new(content: params[:task_name], list_id: params[:list_id])
    list = List.find params[:list_id]
    task = list.tasks.create! content: params[:task_name]
    render json: task
  end

  def destroy
    @task = Task.find params[:id]
    list = @task.list_id
    @task.destroy

    respond_to do | format |
      format.html { redirect_to list_path list }
      format.json { head :no_content }
      format.js   { render :layout => false }

    end
  end
end