class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index

    @similar = params[:similar].to_i
    with = { }
    
    with[:distributeur_name_facet] = params[:distributeur].to_crc32 if params[:distributeur]
    with[:tags] = params[:tags] if params[:tags]
    with[:fabricant_name_facet] = params[:fabricant].to_crc32 if params[:fabricant]
    @facets = Article.facets params[:q], :with => with
    
    @articles = Article.search params[:q], :with => with, :order => :prix_unitaire, :page => params[:page], :per_page => 5
    @articles_ids = Article.search_for_ids params[:q], :with => with, :limit => @articles.total_entries
    


    taggings = Tagging.find @facets[:taggings].map{|t| t[0] unless t[0] == 0 }.compact.uniq, :include => :tag
    @tags = {
      :general => taggings.map{|tagging| tagging.tag if tagging.context == 'general' }.compact.uniq,
      :couleur => taggings.map{|tagging| tagging.tag if tagging.context == 'couleur' }.compact.uniq,
      :dimension => taggings.map{|tagging| tagging.tag if tagging.context == 'dimension' }.compact.uniq,
      :matiere => taggings.map{|tagging| tagging.tag if tagging.context == 'matiere' }.compact.uniq
    }
    
    @fabricants = @facets[:fabricant_name].map{|l| l[0] unless l[0] == 0 }.compact.uniq  
    @distributeurs = @facets[:distributeur_name].map{|l| l[0] unless l[0] == 0 }.compact.uniq  
       
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
  
  def truncate
     
     # @articles = Article.find(:all, :limit => 2000)
     @articles = Article.all
     
  end
   
  # GET /articles/1
  # GET /articles/1.json
  def tagify
    @article = Article.find(params[:id]) 
    @article.general_list = @article.general_list.join(",") + "," + params[:tag_general] 
    @article.matiere_list = @article.matiere_list.join(",") + "," + params[:tag_matiere] 
    @article.couleur_list = @article.couleur_list.join(",") + "," + params[:tag_couleur] 
    @article.dimension_list = @article.dimension_list.join(",") + "," + params[:tag_dimension] 
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_path, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
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
