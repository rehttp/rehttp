class AddDefaultValueForPrivateRequests < ActiveRecord::Migration
  def change
    change_column_default :requests, :private_request, 0
  end
end
