class LengthenLeadsCompany < ActiveRecord::Migration
  def up
    change_column :leads, :company, :string, :limit => 128
  end

  def down
    change_column :leads, :company, :string, :limit => 64
  end
end
