get '/' do
  @categories = Category.all
  erb :index
end

get '/categories/:id/posts' do 
  @posts = Category.find(params[:id]).posts
  erb :posts
end

get '/posts/new' do
  @categories = Category.all
  erb :post_form
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/posts/:id/edit/:key' do
  @post = Post.find(params[:id])
  if @post.secret_key == params[:key]
    @categories = Category.all
    erb :post_form
  else
    "access denied"
  end
end


post '/posts' do
  #logic to create
  post = make_post(params)
  if post.id
    redirect to "/posts/#{post.id}?new=true"
  else
    "missing fields or incorrect info"
  end
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect to "/posts/#{params[:id]}"
end


def make_post(params)
  category = Category.find(params[:category_id])
  category.posts.create(params[:post])
end