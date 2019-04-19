class AddRememberDigestToPengguna < ActiveRecord::Migration[5.2]
  def change
    add_column :pengguna, :remember_digest, :string
  end
end
