class PostsController < ApplicationController
	
	http_basic_authenticate_with name: "jslivebc", password: "cityscape1", except:[:index, :show]	
	
	def new
		@post=Post.new
	end
	
	def create
		#@post = Post.new(post_params)
		@post = Post.new(params[:post].permit(:title, :text))
		if @post.save # saves to the model
			redirect_to @post
		else
			render 'new' #passes back the current @post object
						# this rendering is done in the same request as #the form submission. redirect_to will tell the #browser to issue another request
		end
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy
	 
	  redirect_to posts_path
	end

	
=begin
		multi line comment
		note cannot be indented
=end
	
	def show
		@post = Post.find(params[:id])
	end
	def index
		@posts =Post.all
	end
	
	def update
	  @post = Post.find(params[:id])
	 
	  if @post.update(params[:post].permit(:title, :text))
		redirect_to @post
	  else
		render 'edit'
	  end
	end
	
	def edit
		@post = Post.find(params[:id])
	end 





	private
		def post_params
		params.require(:post).permit(:title, :text)
	end
	

	

end
