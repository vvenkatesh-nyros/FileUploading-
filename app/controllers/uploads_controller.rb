class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
 

  # GET /uploads
  # GET /uploads.json
  def index
   @uploads1 = Upload.where( filename: /.*\.(jpeg|png|gif|jpg)/i ).order("count DESC").page params[:page_img]
   @uploads2=  Upload.where( filename: /.*\.(pdf)/i ).order("count DESC").page params[:page_pdf]
   @uploads3 = Upload.where( filename: /.*\.(doc|docx)/i ).order("count DESC").page params[:page_doc]
   @upload = Upload.new
    session[:user]= nil
    session[:pwd]= nil
  end


  def content
  @uploads1 = Upload.where( filename: /.*\.(jpeg|png|gif|jpg)/i ).order("count DESC").page params[:page_img]
  @uploads2=  Upload.where( filename: /.*\.(pdf)/i ).order("count DESC").page params[:page_pdf]
  @uploads3 = Upload.where( filename: /.*\.(doc|docx)/i ).order("count DESC").page params[:page_doc]
  @upload = Upload.new
  @credentials=People.all
  end




  # GET /uploads/new
  def new
    @upload = Upload.new
  end




  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end



  def person
    @people = People.new
  end



  def register
    @uname=params[:people][:username]
    @pass=params[:people][:password]
    @name=params[:people][:name]
    @email=params[:people][:email]
    @people = People.new(:username => @uname,:password => @pass,:name=> @name,:email => @email)
    if @people.save
     respond_to do |format|
       format.html { redirect_to user_login_path,notice: 'Registered Successfully'}
     end
    else
      respond_to do |format|
       format.html { redirect_to person_path,notice: 'Username Already exists'}
     end
    end 
   end



  def admin_login
    session[:user]= nil
    session[:pwd]= nil
    @login =Login.new
  end 

  def admin_logout
    session[:user]= nil
    session[:pwd]= nil
    redirect_to root_path
  end 

  def user_logout
    session[:user]= nil
    session[:pwd]= nil
    redirect_to root_path
  end 

  def user_login
    session[:user]= nil
    session[:pwd]= nil
    @login = Login.new
   

  end 



  def admin_view
    
    @creds=Login.all
    @creds.each do |cred| 
      @un=cred.username
      @pw=cred.password
    end
     
    begin
      if ((session[:user]==nil) and (session[:pwd]== nil))
          session[:user]=params[:login][:username]
          session[:pwd]= params[:login][:password]
        end
     
      if @un == session[:user] and @pw == session[:pwd]
        
      else
        respond_to do |format|
          format.html { redirect_to "/admin_login" ,notice: 'Invalid Credentials'}
        end
      end
    rescue  
        respond_to do |format|
          format.html { redirect_to "/admin_login" }
        end
    end    

  end





  def user_view

    @val=params[:check1]

 

    @credentials=People.all
    @check=0
 begin
    @credentials.each do |cred| 
        @un1=cred.username
        @pw1=cred.password
        if ((session[:user]==nil) and (session[:pwd]== nil))
          session[:user]=params[:login][:username]
          session[:pwd]= params[:login][:password]
        end
       
      if @un1 == session[:user] and @pw1  == session[:pwd]
       @check=@check+1
         if params[:check1] == "1"
         cookies.signed[:username] = { :value => params[:login][:username], :expires => 2.weeks.from_now }
         cookies.signed[:password] = { :value => params[:login][:password], :expires => 2.weeks.from_now }
        end

      end
    end
    if @check == 0 
      respond_to do |format|
          format.html { redirect_to "/user_login",notice: 'Invalid Credentials' }
        end
    end
   rescue
     respond_to do |format|
          format.html { redirect_to "/user_login" }
        end
   end

end



  def info
  @credentials=People.all.page params[:page]
  @uploads1 = Upload.where( filename: /.*\.(jpeg|png|gif|jpg)/i ).order("count DESC").page params[:page_img]
  @uploads2=  Upload.where( filename: /.*\.(pdf)/i ).order("count DESC").page params[:page_pdf]
  @uploads3 = Upload.where( filename: /.*\.(doc|docx)/i ).order("count DESC").page params[:page_doc]
  end




  def sendmail
    
    @email_user = params[:email]
    @subject = params[:body]
    @src = params[:src]
    @mail=params[:email]
    @id=params[:idref]
    @email = Mailid.new(:mail => @mail,:upload_id => @id)
    @email.save
    @upload = Upload.find(@id)
    @upload.update_attributes(:count => ((@upload.count.nil? ? 0 : @upload.count) + @email.mail.split(",").size) )
    UserMailer.welcome_mail(@email_user,@subject,@src).deliver
      respond_to do |format|
        format.html { redirect_to uploads_url, :notice => "Mail was successfully sent to #{@email_user}" }
      end
  end

 
  def forgot_password
   
    @people=People.new

  end

  def passmail

    begin
     @usn=params[:people][:name]
     @det=People.where(:username => @usn)
     
     @det.each do |cred| 
         @pws=cred.password
         @pmail=cred.email
      end
    UserMailer.pass_mail(@pmail,@pws).deliver
    respond_to do |format|
        format.html { redirect_to user_login_path ,:notice => "Password was successfully sent to #{@pmail}"}
      end
    rescue
       respond_to do |format|
        format.html { redirect_to forgot_password_path ,:notice => "Enter Valid Username"}
      end
    end

  end



 

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @fn=params[:upload][:file].original_filename
    @upload = Upload.new(upload_params)
    @unm=session[:user]
    @upload.update(:filename => @fn,:username => @unm)
    @uploads = Upload.all

    respond_to do |format|
      if @upload.save
        format.html { redirect_to user_view_path, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { redirect_to user_view_path}
        format.js
      end
    end
  end



  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    
  end

  def delete_user
   People.where(:username => params[:uname]).delete
   respond_to do |format|
          format.html { redirect_to "/info" }
        end
  end


  def person_edit
    
    @unam=params[:unam]
    @fname=params[:fname]
    @umail=params[:umail]
    @people=People.new
  
  end


   
  def edit_user
     
    People.where(:username => params[:people][:unam]).update( :name => params[:people][:name],:email => params[:people][:email])
    respond_to do |format|
          format.html { redirect_to "/admin_view" }
     end

  end





  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:file, :mailid)
    end



end
