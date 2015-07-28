json.array!(@games) do |game|
  json.extract! game, :id, :title, :image, :description, :release_date, :iframe, :source, :cat_name
  json.url game_url(game, format: :json)
end
