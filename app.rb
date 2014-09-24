require "sinatra"
require "sinatra/reloader" if development?

GALLERIES = {
  "cats" => ["colonel_meow.jpg", "grumpy_cat.png"],
  "dogs" => ["shibe.png"]
}

get "/" do
  @galleries = GALLERIES
  erb :home
end

get "/galleries/:name" do
  @names = GALLERIES[params[:name]]
  erb :galleries
end
