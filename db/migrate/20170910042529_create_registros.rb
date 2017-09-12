class CreateRegistros < ActiveRecord::Migration[5.1]
  def change
    create_table :registros do |t|
      t.string :foto_url
      t.string :descricao
      t.references :problema, foreign_key: true

      t.timestamps
    end
  end
end
