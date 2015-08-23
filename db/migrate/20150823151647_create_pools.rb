class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :passcode, null:false
    end
  end
end
