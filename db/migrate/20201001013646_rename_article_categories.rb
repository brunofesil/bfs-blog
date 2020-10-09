class RenameArticleCategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles_categories, :article_categories
  end
end
