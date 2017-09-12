class CreateDificuldades < ActiveRecord::Migration[5.1]
  def change
    create_table :dificuldades do |t|
      t.integer :valor
      t.references :usuario, foreign_key: true
      t.references :dificuldade_cod, foreign_key: true

      t.timestamps
    end
  end
end
