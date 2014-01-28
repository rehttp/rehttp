class ChangeRequestFieldSize < ActiveRecord::Migration
  def change
    change_column :requests, :request_data, :text, :limit => 10000
  end
end
