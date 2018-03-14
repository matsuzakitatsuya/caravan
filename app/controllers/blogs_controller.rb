class BlogsController < ApplicationController
  def new
  	@blog = Blog.new
  	#ブログモデルと紐づいた（データを入れるための）空の箱
  	#インスタンスという
  end

  def create
  	blog = Blog.new(blog_params)
  	#ビューから贈られてきたデータをblogsという空き箱に入れている
  	blog.save
  	redirect_to "/blogs"
  	#他のビューに移動するメソッド
  end

  def index
  	@blogs = Blog.all
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  private

	  def blog_params
		  	params.require(:blog).permit(:title, :body, :category)
		  	#ビューから送信されたデータはparamsというメゾットの中に入っている
		  	#ストロングパラメータは、セキュリティを強固にしているもの
	  end

end
