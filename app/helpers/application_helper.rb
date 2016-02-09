module ApplicationHelper
    
    #Checks if logged in user is admin
    def is_admin
        return true if @current_user.name == "admin" #The admin account
    end
    
    #Returns the logged in user
    def current_user
        @current_user || User.find(session[:user_id]) if session[:user_id]
    end
    
    #Help setting title, found help here http://stackoverflow.com/questions/3059704/rails-3-ideal-way-to-set-title-of-pages
    def title(page_title)
        content_for :title, page_title.to_s
    end
end
