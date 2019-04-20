class AddAktivasiToPengguna < ActiveRecord::Migration[5.2]
  def change
    add_column :pengguna, :aktivation_digest, :string
    add_column :pengguna, :activated, :boolean
    add_column :pengguna, :activated_at, :datetime
  end
end
