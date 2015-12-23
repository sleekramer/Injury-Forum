module FavoritesHelper
  def button_if_injury(favoriteable)
    favoriteable.is_a?(Injury) ? "btn btn" : ""
  end
end
