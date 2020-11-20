class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(review_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


# A user can see the list of cocktails
# A user can see the details of a given cocktail, with the dose needed for each ingredient
# A user can create a new cocktail

end

def review_params
  params.require(:cocktail).permit(:name)
end
