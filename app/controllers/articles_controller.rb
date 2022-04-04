class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])  #instance variable (so it's available to the view) that saves the Article pbject info and shows it through picking the corresponding id from the params hash
    end
end