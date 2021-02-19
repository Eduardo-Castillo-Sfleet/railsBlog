class AddColumnStateToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :state, :string
  end
end
