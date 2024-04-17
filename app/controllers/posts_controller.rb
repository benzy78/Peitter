class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save!
    redirect_to posts_url, notice: "投稿されました。"
  end

  def edit
  end

  # Strong Parameters : 不正なデータの登録・更新を防ぐ処理
  private
  def post_params
    params.require(:post).permit(:name, :description)
  end
end
