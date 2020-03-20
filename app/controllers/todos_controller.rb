class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:success] = 'Todo が正常に投稿されました'
            redirect_to @todo
        else
            flash.now[:danger] = 'Todo が投稿されませんでした'
            render :new
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
    	@todo = Todo.find(params[:id])
	 
        if @todo.update(todo_params)
	        flash[:success] = 'Todo は正常に更新されました'
            redirect_to @todo
        else
            flash.now[:danger] = 'Todo は更新されませんでした'
	        render :edit
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:success] = 'Todo は正常に削除されました'
        redirect_to todos_url
    end
    
    private
    # Strong Parameter
    def todo_params
        params.require(:todo).permit(:thing)
    end
end
