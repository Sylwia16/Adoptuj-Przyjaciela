class AdminController < ApplicationController
  def index
    
  end
  
  def contact
  
  end

  def gallery_cat_admin
    @cats = Cat.all
  
  end

  def gallery_dog_admin
    @dogs = Dog.all
  end

  def authenticate_admin!
    # Metoda do weryfikacji, czy użytkownik jest administratorem
    redirect_to root_path unless current_user&.admin?
  end

end
