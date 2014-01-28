class AddPrivateRequestFieldToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :private_request, :integer
  end
end
