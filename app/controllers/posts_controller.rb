class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def top#トップ画面追加
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to posts_path, notice:'投稿しました!'
  else
    render 'new'
  end
end

  def show
    #@post = Post.find(params[:id])←共通化したためコメントアウト
  end
  
  def edit
    #@post = Post.find(params[:id])←共通化したためコメントアウト
  end
  
  def update
     #@post = Post.find(params[:id])←共通化したためコメントアウト
    if @post.update(post_params)
    redirect_to posts_path, notice:'投稿を編集しました!'
  else
    render 'edit'
  end
end

  def destroy
  @post.destroy
  redirect_to posts_path, notice:"投稿を削除しました！"
end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
