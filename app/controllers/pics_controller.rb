class PicsController < ApplicationController
	before_action :find_pic,only: [:show,:edit, :update,:destroy]
	def index
		@pic = Pic.all
	end

	def show
	end

	def new
		@pic = Pic.new
	end
	
	def create
		@pic = Pic.new(pic_params)
		if @pic.save
			redirect_to @pic, notice: "your pic is posted"
		else
			render"new"
		end
	end

	def edit

	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "your pic updated"
		else
			render "edit"
		end
	end

	def destroy
	

	end

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end

end
