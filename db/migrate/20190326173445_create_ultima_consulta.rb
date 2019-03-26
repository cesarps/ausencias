class CreateUltimaConsulta < ActiveRecord::Migration
  def change
    create_table :ultima_consulta do |t|
      t.datetime :data_ultima_consulta

      t.timestamps null: false
    end
  end
end
