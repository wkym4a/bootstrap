class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

    #ブログ画面、一覧表示
    def index
      @blogs=Blog.all
    end


    # 新規画面表示
    def new
      if params[:back]
        @blog = Blog.new(blog_params)
      else
        @blog=Blog.new
      end
    end


    # 更新画面……情報は「set_blog」で取得
    def edit
  #    binding.pry
    end

    # 閲覧画面……情報は「set_blog」で取得
    def show
    end


    #新規登録処理
    def create

      @blog = Blog.new(blog_params)

      respond_to do |format|
        if @blog.save

          #処理後は一覧画面に移動
          format.html { redirect_to blogs_path, notice: '登録しました。' }
        else
          format.html { render :new }
        end
      end
    end


      # 更新処理……情報は「set_blog」で取得
      def update
        respond_to do |format|
          if @blog.update(blog_params)

            #処理後は投稿内容確認画面に移動
            format.html { redirect_to blogs_path, notice: '更新に成功しました。' }
          else
            format.html { render :edit }
          end
        end
      end


      # 削除処理
      def destroy
        @blog.destroy
        respond_to do |format|
          format.html { redirect_to blogs_path, notice: '削除に成功しました。' }
          format.json { head :no_content }
        end
      end



    private

    def set_blog

      @blog = Blog.find(params[:id])
    end


    #DB更新用にパラメータセット
    def blog_params
      params.require(:blog).permit(:title,:content)
    end

end
