class PenggunaController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :set_pengguna, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to :root, alert: 'Maaf, data pengguna yang Anda inginkan tidak dapat ditemukan.'
  end

  # GET /pengguna
  # GET /pengguna.json
  def index
    @pengguna = Pengguna.where(activated: true).paginate(page: params[:page])
  end

  # GET /pengguna/1
  # GET /pengguna/1.json
  def show
    @pengguna = Pengguna.find(params[:id])
    redirect_to root_url and return unless @pengguna.activated?
  end

  # GET /pengguna/new
  def new
    @pengguna = Pengguna.new
  end

  # GET /pengguna/1/edit
  def edit
    @pengguna ||= Pengguna.find_by(id: pengguna_id)
  end

  # POST /pengguna
  # POST /pengguna.json
  def create
    @pengguna = Pengguna.new(pengguna_params)
    if @pengguna.save
      @pengguna.send_activation_email
      flash[:info] = "Untuk mengaktifkan akun Anda, klik pada tautan yang terdapat pada email yang baru saja kami kirim."
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /pengguna/1
  # PATCH/PUT /pengguna/1.json
  def update
    respond_to do |format|
      if @pengguna.update(pengguna_params)
        format.html { redirect_to @pengguna, notice: 'Pengguna was successfully updated.' }
        format.json { render :show, status: :ok, location: @pengguna }
      else
        format.html { render :edit }
        format.json { render json: @pengguna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pengguna/1
  # DELETE /pengguna/1.json
  def destroy
    @pengguna.destroy
    respond_to do |format|
      format.html { redirect_to pengguna_index_url, notice: 'Pengguna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pengguna
      @pengguna = Pengguna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pengguna_params
      params.require(:pengguna).permit(:nama_lengkap, :email, :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Maaf, untuk melihat halaman tersebut Anda harus masuk terlebih dahulu."
      end
    end

    # Confirms the correct user.
    def correct_user
      @pengguna = Pengguna.find(params[:id])
      redirect_to(root_url, notice: "Maaf, hanya Akun milik pribadi yang dapat diedit.") unless current_user?(@pengguna)
    end

    # Returns the hash digest of the given string.
    def Pengguna.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
      self.remember_token = Pengguna.new_token
      update_attribute(:remember_digest, Pengguna.digest(remember_token))
    end
end
