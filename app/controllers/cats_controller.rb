class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:destroy] # Sprawdzenie, czy użytkownik jest adminem

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to admin_gallery_cat_admin_path, notice: 'Kot został pomyślnie utworzony.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to admin_gallery_cat_admin_path, notice: 'Kot został pomyślnie zaktualizowany.'
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to admin_gallery_cat_admin_path, notice: 'Kot został pomyślnie usunięty.'
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :age, :description, :adopted, :image)
  end

  def check_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Nie masz uprawnień do usunięcia tego kota.'
    end
  end
end
