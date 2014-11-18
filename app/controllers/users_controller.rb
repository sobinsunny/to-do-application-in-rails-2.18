
require 'aescrypt'
require 'bcrypt'


class UsersController < ApplicationController
  layout false
  def login
    key ="newdata"
    @tasks=Task.new
    @user=User.new
    if request.post?
      uname=params["user"]["email"]
      paswd=params["user"]["password"]
      @u=User.find_by_email(uname)
      if @u.present?
        #password = AESCrypt.decrypt(@u.password, key)
        if BCrypt::Password.new(@u.password).is_password? paswd
          flash[:notice] = 'successfully Signed.'
          session[:user_id]=@u.id
          redirect_to :controller => "tasks", :action => "index"
        else
          puts "Login not Suceesful"
        end
      else
        puts 'Not successfully Signed.'
      end
    end
  end

  def edit

  end

  def update



  end

  def create
    key ="newdata"
    @user=User.new(params[:user])
    @user[:check]=1;
    paswd=params["user"]["password"]
    @user[:password]=BCrypt::Password.create(paswd)
    if @user.save
      redirect_to login_users_path
    else
      puts "error"
    end

  end

  def new
    @user=User.new
  end

  def logout
    session.delete(:user_id)
    redirect_to login_users_path
  end


end
