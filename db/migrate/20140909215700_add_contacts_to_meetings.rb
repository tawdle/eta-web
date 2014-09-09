class AddContactsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :contacts, :string
  end
end
