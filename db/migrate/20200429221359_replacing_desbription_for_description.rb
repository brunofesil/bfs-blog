class ReplacingDesbriptionForDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :desbription, :description
  end
end
