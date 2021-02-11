class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]
    before_action :set_article, except: [:index, :new, :create]
    #GET /articles
    def index
        @articles = Article.all
    end

    #GET /articles/:id
    def show
        #Article.where.not("id = ? OR title = ?", paramas[:id], params[:title]).count
        @article.update_visits_count
        @comment = Comment.new
    end

    #GET /articles/new
    def new
        @article = Article.new
    end

    def edit 
    end

    #POST /articles
    def create
        @article = current_user.articles.new(article_params) #con Article.create() se hace new y save
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def update
        # @article.update_attributes({title: "Nuevo titulo"})
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    #Todo lo de abajo de private sera privado
    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :body)
    end
end