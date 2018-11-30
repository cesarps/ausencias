class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :sintoma, default: "Passei mal"

      t.timestamps null: false
    end
  end
end
