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
    @post = Post.find(params[:id])
  end

  def  update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "更新されました。"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "#{post.name}を削除しました。"
  end

  # Strong Parameters : 不正なデータの登録・更新を防ぐ処理
  private
  def post_params
    params.require(:post).permit(:name, :description)
  end
end
