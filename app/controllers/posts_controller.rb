class PostsController < ApplicationController

    before_action :find_post, only: [:show, :update, :edit, :destroy]

    def index
        @post = Post.all
    end

    def show
    
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = 'The post was created'
            redirect_to @post
        else
            render 'new'
        end

    end

    def edit
    
    end
    
    def update
        if @post.update(post_params)
            flash[:success] = 'The post was updated'
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path, notice: 'Post destroyed'
    end

private

    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end