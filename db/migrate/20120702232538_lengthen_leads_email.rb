class LengthenLeadsEmail < ActiveRecord::Migration
  def up
    change_column :leads, :email, :string, :limit => 128
  end

  def down
    change_column :leads, :email, :string, :limit => 64
  end
end
