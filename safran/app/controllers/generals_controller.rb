class GeneralsController < ApplicationController
  # GET /generals
  # GET /generals.json
  def index
    @generals = General.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @generals }
    end
  end

  # GET /generals/1
  # GET /generals/1.json
  def show
    @general = General.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @general }
    end
  end

  # GET /generals/new
  # GET /generals/new.json
  def new
    @general = General.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @general }
    end
  end

  # GET /generals/1/edit
  def edit
    @general = General.find(params[:id])
  end

  # POST /generals
  # POST /generals.json
  def create
    @general = General.new(params[:general])

    respond_to do |format|
      if @general.save
        format.html { redirect_to @general, notice: 'General was successfully created.' }
        format.json { render json: @general, status: :created, location: @general }
      else
        format.html { render action: "new" }
        format.json { render json: @general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /generals/1
  # PUT /generals/1.json
  def update
    @general = General.find(params[:id])

    respond_to do |format|
      if @general.update_attributes(params[:general])
        format.html { redirect_to @general, notice: 'General was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generals/1
  # DELETE /generals/1.json
  def destroy
    @general = General.find(params[:id])
    @general.destroy

    respond_to do |format|
      format.html { redirect_to generals_url }
      format.json { head :ok }
    end
  end
end
