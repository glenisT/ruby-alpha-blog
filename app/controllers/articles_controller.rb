class ArticlesController < ApplicationController
    def show    #shows singular articles and their attributes
        @article = Article.find(params[:id])  #instance variable (so it's available to the view) that saves the Article pbject info and shows it through picking the corresponding id from the params hash
    end

    def index   #shows list of articles
        @articles = Article.all
    end

    def new
    end

    def create
    end
    
end