
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #new form
    erb :new
  end

  post '/posts' do #create
    @posts = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do #index
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #show
    @posts = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #edit
    @posts = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #patch
    @posts = Post.find_by_id(params[:id])
    @posts.update_attributes(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do #delete
    erb :delete
  end

end #end of AppController
