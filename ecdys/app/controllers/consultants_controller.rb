class ConsultantsController < ApplicationController
  # GET /consultants
  # GET /consultants.json
  def index
    @consultants = Consultant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultants }
    end
  end

  # GET /consultants/1
  # GET /consultants/1.json
  def show
    @consultant = Consultant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consultant }
    end
  end

  # GET /consultants/new
  # GET /consultants/new.json
  def new
    @consultant = Consultant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consultant }
    end
  end

  # GET /consultants/1/edit
  def edit
    @consultant = Consultant.find(params[:id])
  end

  # POST /consultants
  # POST /consultants.json
  def create
    @consultant = Consultant.new(params[:consultant])

    respond_to do |format|
      if @consultant.save
        format.html { redirect_to @consultant, notice: 'Consultant was successfully created.' }
        format.json { render json: @consultant, status: :created, location: @consultant }
      else
        format.html { render action: "new" }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consultants/1
  # PUT /consultants/1.json
  def update
    @consultant = Consultant.find(params[:id])

    respond_to do |format|
      if @consultant.update_attributes(params[:consultant])
        format.html { redirect_to @consultant, notice: 'Consultant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultants/1
  # DELETE /consultants/1.json
  def destroy
    @consultant = Consultant.find(params[:id])
    @consultant.destroy

    respond_to do |format|
      format.html { redirect_to consultants_url }
      format.json { head :ok }
    end
  end
end
