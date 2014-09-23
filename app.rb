require "sinatra"
require "sinatra/reloader" if development?

get "/" do
  erb :home
end

get "/cats/:id" do
  @project_id = params[:id]
  erb :project
end
