class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :sintoma

      t.timestamps null: false
    end
  end
end
