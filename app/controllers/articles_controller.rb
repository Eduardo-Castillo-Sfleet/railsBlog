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

    def edit 
        @article = Article.find(params[:id])
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
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    #Todo lo de abajo de private sera privado
    private 
    
    def article_params
        params.require(:article).permit(:title, :body)
    end
end