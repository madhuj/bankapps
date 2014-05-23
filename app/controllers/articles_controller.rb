class ArticlesController < ApplicationController

  respond_to :html, :js
  def new
   @article = Article.new
 end

 def index
   @articles = Article.search(params[:search]).order("title").page(params[:page]).per( 5 )
   
 end
 

 def show
  @article = Article.find(params[:id])
end

def create
  @article = Article.new(article_params)
  
  if @article.save
    flash[:notice] = "Details are  successfully created"
    redirect_to @article
  else
    flash[:alert] = "abort Please entire the details"
    render 'new'

  end
end


def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end


def destroy
  @article = Article.find(params[:id])
  @article.destroy
  
  redirect_to articles_path
end
  
  private
  def article_params
  params.require(:article).permit(:title,:text,:firstname,:lastname, :state, :pincode,:phone,:country)
  end
end







