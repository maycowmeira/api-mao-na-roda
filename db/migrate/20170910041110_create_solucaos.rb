class CreateSolucaos < ActiveRecord::Migration[5.1]
  def change
    create_table :solucaos do |t|
      t.string :descricao
      t.references :usuario, foreign_key: true
      t.references :resultado, foreign_key: true

      t.timestamps
    end
  end
end
