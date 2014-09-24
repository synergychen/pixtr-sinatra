require "sinatra"
require "sinatra/reloader" if development?
require "pg"

database = PG.connect({ dbname: "photo_gallery" })

get "/" do
  gallery_result = database.exec_params("SELECT * FROM galleries")
  @gallery_names = gallery_result.map { |gallery| gallery["name"] }
  erb :home
end

get "/galleries/:name" do
  # params[:name] returns String
  @name = params[:name]
  @names = GALLERIES[@name]
  erb :galleries
end
