class ArticlesController < ApplicationController
  #Creates an index of all the articles being submitted.
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    #render plain: params[ :article].inspect
    if @article.save
    redirect_to @article
    else
      #rendering is done within the same request
    render 'new'
    end

  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
