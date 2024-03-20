class PostsController < ApplicationController
before_action :authenticate_request, only: [:create, :index, :show,:destroy]

 def index
    @posts =Post.all 
     render json: @posts
 end

 def show 
    @post =Post.find(params[:id])
     render json: @post
 end

    def create

        @post = @current_user.posts.build(post_params)
        if @post.save 
            render json: @post, status: :created
        else
            render json: {errors: @post.errors.full_messages}, status: :unproccessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

    private

    def post_params
        params.permit(:title, :content)
    end

end
