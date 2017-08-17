require 'pry'
class FilmFile < Sinatra::Base
  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/directors/:id' do
    id = params["id"]
    @director = Director.find(id)
    @films = Film.where(director_id: id)
    erb :directors_show
  end

end
