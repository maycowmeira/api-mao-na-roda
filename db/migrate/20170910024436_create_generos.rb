class CreateGeneros < ActiveRecord::Migration[5.1]
  def change
    create_table :generos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
