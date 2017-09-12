class CreateEscolaridades < ActiveRecord::Migration[5.1]
  def change
    create_table :escolaridades do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
