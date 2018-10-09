
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    #binding.pry
    id = params[:id].to_i
    @post = Post.find{|post| post.id == id}
    erb :show
  end

  get '/posts/:id/edit' do
    id = params[:id].to_i
    @post = Post.find{|post| post.id == id}
    erb :edit
  end

  patch '/posts/:id' do
    Post.update(params[:id].to_i, :name => params[:name], :content => params[:content])
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    #binding.pry
    Post.delete(params[:id].to_i)
    #redirect "/posts/"
  end

end
