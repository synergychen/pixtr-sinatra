require "sinatra"
require "sinatra/reloader" if development?
require "pg"

database = PG.connect({ dbname: "photo_gallery" })

get "/" do
  gallery_result = database.exec_params("SELECT * FROM galleries")
  @gallery_names = gallery_result.map { |gallery| gallery["name"] }
  erb :home
end

get "/galleries/:id" do
  id = params[:id]
  name_gallery_query = "SELECT name FROM galleries WHERE id = $1"
  name_gallery = database.exec_params(name_gallery_query, [id])
  @name = name_gallery.first["name"]
  puts @name.inspect
  @images = []
  erb :galleries
end
