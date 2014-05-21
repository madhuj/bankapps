class AddColumnsToArticles < ActiveRecord::Migration
  def change
  	add_column :articles,:firstname,:string 
  	add_column :articles,:lastname,:string
  	add_column :articles,:state,:string
  	add_column :articles,:pincode,:integer
  	add_column :articles,:phone,:string
  	add_column :articles,:country,:string
  end
end
