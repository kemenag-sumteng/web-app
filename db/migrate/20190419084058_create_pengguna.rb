class CreatePengguna < ActiveRecord::Migration[5.2]
  def change
    create_table :pengguna do |t|
      t.string :nama_lengkap
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :pengguna, :email, unique: true
  end
end
