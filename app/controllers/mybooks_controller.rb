class MybooksController < ApplicationController
  # GET /mybooks
  # GET /mybooks.json
  def index
    @mybooks = Mybook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @mybooks }
    end
  end

  def administrator
    @admin = Admin.new  
       
    respond_to do |format|
      format.html
    end 
  end

  # GET /mybooks/1
  # GET /mybooks/1.json
  def show
    @mybook = Mybook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @mybook }
    end
  end

  # GET /mybooks/new
  # GET /mybooks/new.json
  def new
    @mybook = Mybook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @mybook }
    end
  end

  # GET /mybooks/1/edit
  def edit
    @mybook = Mybook.find(params[:id])
  end

  # POST /mybooks
  # POST /mybooks.json
  def create
    @mybook = Mybook.new(params[:mybook])

    respond_to do |format|
      if @mybook.save
        format.html { redirect_to mybooks_path, :notice => 'Mybook was successfully created.' }
        format.json { render :json => @mybook, :status => :created, :location => @mybook }
      else
        format.html { render :action => "new" }
        format.json { render :json => @mybook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mybooks/1
  # PUT /mybooks/1.json
  def update
    @mybook = Mybook.find(params[:id])

    respond_to do |format|
      if @mybook.update_attributes(params[:mybook])
        format.html { redirect_to @mybook, :notice => 'Mybook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @mybook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mybooks/1
  # DELETE /mybooks/1.json
  def destroy
    @mybook = Mybook.find(params[:id])
    @mybook.destroy

    respond_to do |format|
      format.html { redirect_to mybooks_url }
      format.json { head :no_content }
    end
  end
end
