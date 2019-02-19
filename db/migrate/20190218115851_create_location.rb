class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
    	t.float :latitude
    	t.float :longitude
    	t.string :ip_address
    	t.belongs_to :car
    	t.timestamps
    end
  end
end
