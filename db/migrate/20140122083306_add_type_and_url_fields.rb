class AddTypeAndUrlFields < ActiveRecord::Migration
  def change
    add_column :requests, :type, :string
    add_column :requests, :url, :string
  end
end
