class CreateDificuldadeCods < ActiveRecord::Migration[5.1]
  def change
    create_table :dificuldade_cods do |t|
      t.string :nome

      t.timestamps
    end
  end
end
