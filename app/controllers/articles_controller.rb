class ArticlesController < ApplicationController

http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

def new
	@article = Article.new
end

def edit
	@article = Article.find(params[:id])
end

def index
	@articles = Article.all
end

def show
	@article = Article.find(params[:id])
end

def create
	@article = Article.new(article_params)

	if @article.save
	redirect_to @article
	else
	render 'new' # using render and not redirect to because it will tell the browser to issue another request!
	end
end
#	@article.save #this is responsible for saving the model in the database
	# will also return a boolean indicating whether the article was saved or not
#	redirect_to @article
#	render plain: params[:article].inspect	


# you can call destroy on Active Record objects when you want to delete them from the database
def destroy
	@article = Article.find(params[:id])
	@article.destroy

	redirect_to articles_path
end

def update
	@article = Article.find(params[:id])
	if # @article.update(article_params)
	#redirect_to @article
	#else
	render 'edit'
end
end

private
	def article_params
	params.require(:article).permit(:title, :text)
end
end		# the permit in this case allows us to accept both title and text in this action
