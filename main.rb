require 'sinatra'
require 'yaml/store'
require 'sequel'
require 'json'
DB = Sequel.connect('sqlite:///home/taylor/snap/dbeaver-ce/104/.local/share/DBeaverData/workspace6/.metadata/sample-database-sqlite-1/Chinook.db')
get '/' do
  @title = 'Welcome to Main!'
  erb :index
end

AlID = {0=>'Album ID'}

get '/album/:albumid' do

  @album = DB[:Album].where(AlbumId: params[:albumid]).select(:Title, :Artistid)
  p @album.sql
  @album.first.to_json
end