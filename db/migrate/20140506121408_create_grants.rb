class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|

      t.timestamps
    end
  end
end
