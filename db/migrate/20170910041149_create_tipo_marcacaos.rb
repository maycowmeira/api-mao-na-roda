class CreateTipoMarcacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_marcacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
