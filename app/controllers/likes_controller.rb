class LikesController < ApplicationController
	def create
		micropost = Micropost.find(params[:micropost_id])
		like = current_user.likes.new(micropost_id: micropost.id)
		like.save
		redirect_to micropost_path(micropost)
	end

	def destroy
		micropost = Micropost.find(params[:micropost_id])
		like = current_user.likes.find_by(micropost_id: micropost.id)
		like.destroy
		redirect_to micropost_path(micropost)
	end
end
