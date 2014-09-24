require "sinatra"
require "sinatra/reloader" if development?
require "pg"

database = PG.connect({ dbname: "photo_gallery" })
gallery_result = database.exec_params("SELECT * FROM galleries")

get "/" do
  @gallery_name = []
  gallery_result.each do |gallery|
    @gallery_name << gallery["name"]
  end
  erb :home
end

get "/galleries/:name" do
  @name = params[:name]
  @names = GALLERIES[@name]
  erb :galleries
end
