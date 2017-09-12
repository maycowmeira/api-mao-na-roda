class CreateProblemas < ActiveRecord::Migration[5.1]
  def change
    create_table :problemas do |t|
      t.lseg :coordenadas
      t.string :descricao
      t.references :usuario, foreign_key: true
      t.references :tipo_marcacao, foreign_key: true
      t.references :solucao, foreign_key: true

      t.timestamps
    end
  end
end
