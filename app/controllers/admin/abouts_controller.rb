class Admin::AboutsController < ApplicationController
  before_action :set_admin_about, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show]
  def show
  end

  # GET /admin/abouts/new
  def new
    @about = About.new
  end

  # GET /admin/abouts/1/edit
  def edit
  end

  # POST /admin/abouts
  # POST /admin/abouts.json
  def create
    @about = About.new(about_params)

    respond_to do |format|
      if @about.save
        format.html { redirect_to @about, notice: 'About was successfully created.' }
        format.json { render :show, status: :created, location: @about }
      else
        format.html { render :new }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/abouts/1
  # PATCH/PUT /admin/abouts/1.json
  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to @about, notice: 'About was successfully updated.' }
        format.json { render :show, status: :ok, location: @about }
      else
        format.html { render :edit }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/abouts/1
  # DELETE /admin/abouts/1.json
  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to admin_abouts_url, notice: 'About was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_about
      @about = About.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit( :title, :description, :admin_id, :photo)
    end
end
