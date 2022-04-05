class ArticlesController < ApplicationController
    #methods a.k.a actions logically paired as follows: index-show, new-create, edit-update
    def show    #shows singular articles and their attributes
        @article = Article.find(params[:id])  #instance variable (so it's available to the view) that saves the Article pbject info and shows it through picking the corresponding id from the params hash
    end

    def index   #shows list of articles
        @articles = Article.all
    end

    def new
        @article = Article.new  #on the first time we open articles/new we have an empty article object so that it doesnt throw 'nil class' error
    end

    def edit  #sends us to the specific article using the id(just like new)
        @article = Article.find(params[:id]) #we need the initialization and id because we use the instance variable in new.html.erb error flashing, and id for the url path

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description)) #require both fields to create new article
        if @article.save
            flash[:notice] = "Article was created successfully."  #flash is a Rails heper that can make messages for the user (works like a hash, keys being :notice and :alert)
            redirect_to article_path(@article)  #this redirects after saving new article to db. 'article' is the prefix of the page and Rails knows by itself to send to the (@article) corresponding page. Needs to be 'enabled' with embeded html(look at application.html.erb)
        else
            render :new, status: :unprocessable_entity    #renders the new.html.erb file with the error messages
        end
    end

    def update #updates the article 'edit' sent us to, with the new information
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully"
            redirect_to article_path(@article)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end
