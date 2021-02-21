class ArticleMailer < ApplicationMailer
    def new_artile(article)
        @article = article

        User.all.each do |user|
            mail(to: user.email, subject: "Nuevo artículo")
        end
    end
end
