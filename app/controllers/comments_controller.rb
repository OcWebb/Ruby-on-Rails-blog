class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params.merge(email: current_user.email))
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        if (current_user.email == @comment.email)
            if (@comment.destroy)
                redirect_to post_path(@post)
            else 
                flash[:info] = "Something went wrong"
                render :show
            end
        else 
            flash[:danger] = "ERROR_USER_MISMATCH: You are not allowed to delete this comment"
            redirect_to post_path(@post)
        end
    end

    private def comment_params
        params.require(:comment).permit(:body)
    end
end
