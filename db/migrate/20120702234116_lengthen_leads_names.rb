class LengthenLeadsNames < ActiveRecord::Migration
  def up
    change_column :leads, :first_name, :string, :limit => 128
    change_column :leads, :last_name, :string, :limit => 128
  end

  def down
    change_column :leads, :first_name, :string, :limit => 64
    change_column :leads, :last_name, :string, :limit => 64
  end
end
