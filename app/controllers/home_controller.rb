class HomeController < ApplicationController
  def index
  end
  
  def contact
  
  end

  def gallery_cat
    @cats = Cat.all
  
  end

  def gallery_dog
    @dogs = Dog.all
  
  end
end
