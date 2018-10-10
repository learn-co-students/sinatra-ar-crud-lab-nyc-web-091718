
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#loads a new form for user to create new blog post
  get '/posts/new' do
    erb :new
  end

#creates (create action) a new post
  post '/posts' do
    @post = Post.create(params)
    redirect to "/posts"
  end

# #index page is loaded
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#show details for one particular post
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end


#loads the form in order for user to edit
  get '/posts/:id/edit'do
  @post = Post.find_by_id(params[:id])
    erb :edit
  end

  # updates the post once user has submitted form and saves new edits to db
 patch '/posts/:id' do
   @post = Post.find_by_id(params[:id])
   @post.update_attributes(name: params[:name], content: params[:content])
   @post.save
   redirect to "/posts/#{@post.id}"
 end



 delete '/posts/:id/delete' do #delete action
   @post = Post.find_by_id(params[:id])
   @post.delete
   erb :deleted
   redirect to '/posts'
 end



end
