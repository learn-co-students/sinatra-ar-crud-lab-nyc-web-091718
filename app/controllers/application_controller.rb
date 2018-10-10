
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  post '/posts' do
    @post = Post.create
   @post.name = params["name"]
   @post.content = params["content"]
    @post.save
    # binding.pry
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end


  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])

    erb :edit
  end

  # get '/posts/:id/delete' do
  #   @post = Post.find_by_id(params[:id])
  #   erb :delete
  # end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end


  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end





end
