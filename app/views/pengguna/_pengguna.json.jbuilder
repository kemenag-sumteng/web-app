json.extract! pengguna, :id, :nama_lengkap, :email, :created_at, :updated_at
json.url pengguna_url(pengguna, format: :json)
