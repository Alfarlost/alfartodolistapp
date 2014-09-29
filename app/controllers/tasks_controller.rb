class TasksController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_todolist
	before_filter :find_task, :except =>[:create]

def destroy
		@task.destroy
		redirect_to todolist_path(@todolist), :notice => "Task was deleted!"
end


def create
	@task = @todolist.tasks.create(task_params)
		unless @task
			flash[:error] = "Task can't be created!"
			redirect_to todolist_path(@todolist)
		else
			flash[:notice] = "Task was created!"
			redirect_to todolist_path(@todolist)
		end
end

def complete
		if @task.completed == false
			@task.update_attribute(:completed, true)
			redirect_to todolist_path(@todolist)
		else
			@task.update_attribute(:completed, false)
			redirect_to todolist_path(@todolist)
		end
end

def edit

end

def update
		if @task.update_attributes(task_params)
			flash[:notice] = "Todo was updated!"
			redirect_to todolist_path(@todolist)
		else
			flash[:error] = "Todo can't be updated!"
			redirect_to todolist_path(@todolist)
		end
	end

def set_deadline

end

def create_deadline
		if @task.update_attributes(task_params)
			flash[:notice] = "Deadline set"
			redirect_to todolist_path(@todolist)
		else
			flash[:error] = "Could not set deadline"
			redirect_to set_deadline_todolist_task_path(@todolist, @task)
		end
end

  private

def task_params
    	params.require(:task).permit(:task_id, :task_name, :completed, :deadline, :priority)
end

protected
	def find_todolist
		   @todolist = Todolist.find(params[:todolist_id])
	end
	
	def find_task
		   @task = @todolist.tasks.find(params[:id])
	end
end

