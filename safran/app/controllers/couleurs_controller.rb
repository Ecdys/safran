class CouleursController < ApplicationController
  # GET /couleurs
  # GET /couleurs.json
  def index
    @couleurs = Couleur.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @couleurs }
    end
  end

  # GET /couleurs/1
  # GET /couleurs/1.json
  def show
    @couleur = Couleur.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @couleur }
    end
  end

  # GET /couleurs/new
  # GET /couleurs/new.json
  def new
    @couleur = Couleur.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @couleur }
    end
  end

  # GET /couleurs/1/edit
  def edit
    @couleur = Couleur.find(params[:id])
  end

  # POST /couleurs
  # POST /couleurs.json
  def create
    @couleur = Couleur.new(params[:couleur])

    respond_to do |format|
      if @couleur.save
        format.html { redirect_to @couleur, notice: 'Couleur was successfully created.' }
        format.json { render json: @couleur, status: :created, location: @couleur }
      else
        format.html { render action: "new" }
        format.json { render json: @couleur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /couleurs/1
  # PUT /couleurs/1.json
  def update
    @couleur = Couleur.find(params[:id])

    respond_to do |format|
      if @couleur.update_attributes(params[:couleur])
        format.html { redirect_to @couleur, notice: 'Couleur was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @couleur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couleurs/1
  # DELETE /couleurs/1.json
  def destroy
    @couleur = Couleur.find(params[:id])
    @couleur.destroy

    respond_to do |format|
      format.html { redirect_to couleurs_url }
      format.json { head :ok }
    end
  end
end
