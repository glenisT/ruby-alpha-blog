class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime  #add new columns to existing DB object after db:migrate has been run once, without the need for db:rollback
  end
end
