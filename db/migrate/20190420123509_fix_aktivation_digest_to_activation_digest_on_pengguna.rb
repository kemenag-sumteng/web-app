class FixAktivationDigestToActivationDigestOnPengguna < ActiveRecord::Migration[5.2]
  def change
  	rename_column :pengguna, :aktivation_digest, :activation_digest
  end
end
