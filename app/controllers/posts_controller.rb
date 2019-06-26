class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.topic_id = params[:topic_id]
    @post.user_id = current_user.id

  end
  
  def create 
    
    @post = current_user.posts.new(post_params)
   
    
    if @post.save
      redirect_to topics_path, success: 'コメント投稿に成功しました'
    else
      flash.now[:danger] = "コメント「#{@post.comment}」ユーザー「#{@post.user_id}」トピック「#{@post.topic_id}」投稿に失敗しました"
      render :new
    end
    
  end
  
  private
  def post_params
    params.require(:post).permit(:comment, :topic_id)
  end
  
end
