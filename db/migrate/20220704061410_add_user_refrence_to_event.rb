class AddUserRefrenceToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :user, index: true
  end
end
