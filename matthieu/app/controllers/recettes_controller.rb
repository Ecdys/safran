class RecettesController < ApplicationController
  # GET /recettes
  # GET /recettes.json
  def index
    @recettes = Recette.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recettes }
    end
  end

  # GET /recettes/1
  # GET /recettes/1.json
  def show
    @recette = Recette.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/new
  # GET /recettes/new.json
  def new
    @recette = Recette.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recette }
    end
  end

  # GET /recettes/1/edit
  def edit
    @recette = Recette.find(params[:id])
  end

  # POST /recettes
  # POST /recettes.json
  def create
    @recette = Recette.new(params[:recette])

    respond_to do |format|
      if @recette.save
        format.html { redirect_to @recette, notice: 'Recette was successfully created.' }
        format.json { render json: @recette, status: :created, location: @recette }
      else
        format.html { render action: "new" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recettes/1
  # PUT /recettes/1.json
  def update
    @recette = Recette.find(params[:id])

    respond_to do |format|
      if @recette.update_attributes(params[:recette])
        format.html { redirect_to @recette, notice: 'Recette was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recettes/1
  # DELETE /recettes/1.json
  def destroy
    @recette = Recette.find(params[:id])
    @recette.destroy

    respond_to do |format|
      format.html { redirect_to recettes_url }
      format.json { head :ok }
    end
  end
end
