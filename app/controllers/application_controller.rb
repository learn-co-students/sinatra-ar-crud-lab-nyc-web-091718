
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)  #creates a post
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index           #loads index page
  end

  get '/posts/:id' do                       #One post
    @post = Post.find_by_id(params[:id]) #loads show page
    erb :show
  end

  get '/posts/:id/edit' do    #loads edit form
   @post = Post.find_by_id(params[:id])
   erb :edit
 end

  patch '/posts/:id' do  #updates a post
   @post = Post.find_by_id(params[:id])
   @post.name = params[:name]
   @post.content = params[:content]
   @post.save
   erb :show
 end

  delete '/posts/:id/delete' do
   @post = Post.find_by_id(params[:id])
   @post.destroy
    redirect '/posts'
   erb :deleted
 end

end
