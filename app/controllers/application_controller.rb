
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

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts/:id' do
    @post = Post.all.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.all.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.all.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
    erb :delete
  end

end
