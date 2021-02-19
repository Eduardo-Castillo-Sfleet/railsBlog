class AddColumnStateToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :state, :string, default: "draft"
  end
end
