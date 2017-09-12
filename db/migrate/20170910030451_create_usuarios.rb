class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :password_digest
      t.integer :ano
      t.string :profissao
      t.string :restricao
      t.string :restricao_outras
      t.references :genero, foreign_key: true
      t.references :perfil, foreign_key: true
      t.references :escolaridade, foreign_key: true

      t.timestamps
    end
  end
end
