class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy, :adopt]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :adopt]
  before_action :check_admin, only: [:destroy] # Sprawdzenie, czy użytkownik jest adminem

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to admin_gallery_dog_admin_path, notice: 'Pies został pomyślnie utworzony.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to admin_gallery_dog_admin_path, notice: 'Pies został pomyślnie zaktualizowany.'
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    
    # Usuń powiązane adopcje
    @dog.adoptions.destroy_all
    
    # Następnie usuń psa
    @dog.destroy
    
    redirect_to admin_gallery_dog_admin_path, notice: 'Pies został usunięty.'
  end

  def adopt
    @adoption = Adoption.new(dog: @dog, user: current_user)
  
    if @adoption.save
      redirect_to user_gallery_dog_user_path, notice: 'Zaadoptowałeś wirtualnie tego psa.'
    else
      redirect_to user_gallery_dog_user_path, alert: 'Zaadoptowłeś już tego psa'
    end
  end
  



  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :description, :adopted, :image)
  end

  def check_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Nie masz uprawnień do usunięcia tego kota.'
    end
  end
end
