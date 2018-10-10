
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :homepage
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    post = Post.create(params)
    redirect "/posts/#{post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    # seems like we can't just do @post.update(params) because ActiveRecord thinks the _method is an attribute and gives an argument error. Will have to specifically state which attributes to update.
    @post.update_attributes(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.destroy(@post.id)
    erb :delete
  end

end #end ApplicationController class
