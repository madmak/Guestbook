class MybooksController < ApplicationController
  # GET /mybooks
  def index
    @mybooks = Mybook.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def administrator
    @admin = Admin.new  
      if params[:username] == 'admin' && params[:password] == 'martini'
	cookies[:username] = { :value => "admin", :expires => Time.now + 3600 }
	cookies[:password] = { :value => "martini", :expires => Time.now + 3600 }
        redirect_to mybooks_path
      end
  end

  def logout
    cookies.delete :username
    cookies.delete :password
    redirect_to mybooks_path
  end

  # GET /mybooks/1
  def show
    @mybook = Mybook.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /mybooks/new
  def new
    @mybook = Mybook.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /mybooks/1/edit
  def edit
    if cookies[:username] != 'admin'
      redirect_to mybooks_path 
    end
    @mybook = Mybook.find(params[:id])

  end

  # POST /mybooks
  def create
    @mybook = Mybook.new(params[:mybook])

    respond_to do |format|
      if @mybook.save
        format.html { redirect_to mybooks_path, :notice => 'Mybook was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /mybooks/1
  def update
    @mybook = Mybook.find(params[:id])
    
    respond_to do |format|
      if @mybook.update_attributes(params[:mybook])
        format.html { redirect_to @mybook, :notice => 'Mybook was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /mybooks/1
  def destroy
  
      if cookies[:username] != 'admin'
            redirect_to mybooks_path
                
      else
  
    @mybook = Mybook.find(params[:id])
    @mybook.destroy

    respond_to do |format|
      format.html { redirect_to mybooks_url }
      end
    end
  end
end
