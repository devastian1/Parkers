class AddColumnToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :ip_address, :string
  end
end
