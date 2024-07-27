class UserController < ApplicationController
  def index
  end
  
  def contact
  
  end

  def gallery_cat_user
    @cats = Cat.all
  
  end

  def gallery_dog_user
    @dogs = Dog.all
  end
end
