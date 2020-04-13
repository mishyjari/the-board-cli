class CreateDispatcher < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatchers do |t|
      t.string :name
      t.string :username
    end
  end
end
