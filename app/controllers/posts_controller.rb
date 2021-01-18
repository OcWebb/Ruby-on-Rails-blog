class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params.merge(email: current_user.email))

        if (@post.save)
            redirect_to @post
        else 
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if (@post.update(post_params))
            redirect_to @post
        else 
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])

        if (current_user.email == @post.email)
            if (@post.destroy)
                redirect_to controller: :pages, action: "index"
            else 
                flash[:info] = "Something went wrong"
                render :show
            end
        else 
            flash[:danger] = "ERROR_USER_MISMATCH: You are not allowed to delete this post"
            render :show
        end
        
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end
end
