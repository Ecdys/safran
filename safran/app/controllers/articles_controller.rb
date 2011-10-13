class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.search params[:search], :order => :prix_unitaire, :field_weights => {:description => 20, :description_etendue => 10, :fabricant => 5}, :match_mode => :boolean, :page => params[:page], :per_page => 40
    # @facets   = Article.facets params[:search], :class_facet => false
    
    with = { }

    @facets = Article.facets params[:q], :with => with

    with[:tags] = params[:tags] if params[:tags]

    @articles = Article.search params[:q], :with => with, :order => :prix_unitaire
    @articles_ids = Article.search_for_ids params[:q], :with => with, :limit => @articles.total_entries

    taggings = Tagging.find @facets[:taggings].map{|t| t[0] unless t[0] == 0 }.compact.uniq, :include => :tag
    @tags = {
      :general => taggings.map{|tagging| tagging.tag if tagging.context == 'general' }.compact.uniq,
      :couleur => taggings.map{|tagging| tagging.tag if tagging.context == 'couleur' }.compact.uniq,
      :dimension => taggings.map{|tagging| tagging.tag if tagging.context == 'dimension' }.compact.uniq,
      :matiere => taggings.map{|tagging| tagging.tag if tagging.context == 'matiere' }.compact.uniq
    }
    
    @fabricants = @facets[:fabricant].map{|l| l[0] unless l[0] == 0 }.compact.uniq  
       
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
end
