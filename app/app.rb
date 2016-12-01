ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link'

class Bookmarks_manager < Sinatra::Base
  get '/' do
    'Hello bookmarks_manager!'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect('/links')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
