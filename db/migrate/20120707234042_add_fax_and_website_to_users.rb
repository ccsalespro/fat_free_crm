class AddFaxAndWebsiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fax, :string
    add_column :users, :website, :string
  end
end
