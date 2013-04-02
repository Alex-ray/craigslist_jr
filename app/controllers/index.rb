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

  erb :post_form
end


post '/posts' do
  #logic to create
  post = make_post(params)
  redirect to "/posts/#{post.id}"
end

post '/posts/:id' do
  #update post
  redirect to '/posts/'#THE ID
end


def make_post(params)
  category = Category.find(params[:category])
  category.posts.create(title: params[:title], email: params[:email],
                        price: params[:price], description: params[:description])

end