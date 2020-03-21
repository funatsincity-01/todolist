class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    
    def index
        #@todos = Todo.all
        @todos = Todo.order(id: :desc).page(params[:page]).per(10)
    
    end

    def show
        set_todo
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:success] = 'Todo が正常に投稿されました'
            redirect_to @todo
            #　redirect_to @todo　は　redirect_to todo_path(@todo)　と同じ。
        else
            flash.now[:danger] = 'Todo が投稿されませんでした'
            render :new
        end
    end

    def edit
        set_todo
    end

    def update
    	set_todo
	 
        if @todo.update(todo_params)
	        flash[:success] = 'Todo は正常に更新されました'
            redirect_to @todo
        else
            flash.now[:danger] = 'Todo は更新されませんでした'
	        render :edit
        end
    end

    def destroy
        set_todo
        @todo.destroy
        flash[:success] = 'Todo は正常に削除されました'
        redirect_to todos_url
    end
    
    private
    # Strong Parameter
    def todo_params
        params.require(:todo).permit(:thing, :memo)
    end
    
    def set_todo
        @todo = Todo.find(params[:id])    
    end
    
end
