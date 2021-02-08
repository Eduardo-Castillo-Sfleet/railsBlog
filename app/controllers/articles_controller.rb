class ArticlesController < ApplicationController
    #GET /articles
    def index
        @articles = Article.all
    end

    #GET /articles/:id
    def show
        @article = Article.find(params[:id])

        #Article.where.not("id = ? OR title = ?", paramas[:id], params[:title]).count
    end

    #GET /articles/new
    def new
        @article = Article.new
    end

    #POST /articles
    def create
        @article = Article.new(title: params[:article][:title],
                            body: params[:article][:body]) #con Article.create() se hace new y save
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def update
        # @article.update_attributes({title: "Nuevo titulo"})
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end