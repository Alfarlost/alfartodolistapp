class TodolistsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_todolist, :except =>[:index, :create, :new]

def index 
	@user_todolists = current_user.todolists
end

def destroy
	@todolist.destroy
	redirect_to :action => 'index'
	flash[:notice] = "Todolist was deleted!"
end

def new
	@todolist = Todolist.new
end

def create
	@todolist = current_user.todolists.create(todolist_params)
  if !@todolist.valid?
       flash[:error] = "Todolist can't be created!"
	redirect_to new_todolist_path
  else 
	flash[:notice] = "Todolist created!"
	redirect_to :action => 'index'
	end
end

def show
	@task = @todolist.tasks.new
end

def edit

end

def update
	
	if @todolist.update_attributes(todolist_params)
	flash[:notice] = "Todolist updated!"
	redirect_to todolist_path(@todolist)

	else flash[:error] = "Todolist can't be updated!"
	redirect_to edit_todolist_path(@todolist)
	end
end

def todolist_params
    params.require(:todolist).permit(:todolist_name)
end

def find_todolist
		   @todolist = Todolist.find(params[:id])
end

end
