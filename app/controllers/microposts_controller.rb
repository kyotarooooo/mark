class MicropostsController < ApplicationController
	def new
		@micropost = Micropost.new
	end

	def create
		@micropost = Micropost.new(micropost_params)
		@micropost.user = current_user
		if @micropost.save
			redirect_to micropost_path(@micropost)
		else
			render 'new'
		end
	end

	def index
		@microposts = Micropost.all
	end

	def show
		@micropost = Micropost.find(params[:id])
	end

	def edit
		@micropost = Micropost.find(params[:id])
	end

	def update
		@micropost = Micropost.find(params[:id])
		@micropost.user = current_user
		if @micropost.update(micropost_params)
			redirect_to micropost_path(@micropost)
		else
			render 'edit'
		end
	end

	def destroy
		@micropost = Micropost.find(params[:id])
		@micropost.destroy
		redirect_to microposts_path
	end

	private
	def micropost_params
		params.require(:micropost).permit(:title, :body, :user_id)
	end
end
