class CreateResultados < ActiveRecord::Migration[5.1]
  def change
    create_table :resultados do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
