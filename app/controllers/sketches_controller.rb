class SketchesController < ApplicationController
	
#	before_filter :authenticate_user!, :except => :show

	def create
		@sketch = current_user.build_sketch(params[:sketch])
		if @sketch.save
			flash[:success] = "Sketch info updated"
			render 'show'
		else
			@title = "User sketch"
			flash[:error] = "Something went wrong. Try again"
			render 'edit'
		end
	end

	def show
		@sketch = Sketch.find_by_id(params[:id])
		if @sketch
			@title = "Sketch"
		else
			flash[:notice] = "No d such user exists"
			redirect_to root_path
		end
	end

	def edit
		@sketch = Sketch.find_by_user_id(current_user.id)
		@sketch ||= Sketch.new
    	@title = "Edit your sketch"
	end

	def update
		@sketch = Sketch.find_by_user_id(current_user.id)
		if current_user.sketch.update_attributes(params[:sketch])
			flash[:success] = "Sketch updated"
			render 'show'
		else
			#flash[:notice] = "Something went wrong"
			@title = "Edit user"
			render 'edit'
		end
	end

	def destroy
	end	

	def index
		@sketch = Sketch.find_by_user_id(current_user.id)
		if @sketch
			@title = "Sketch"
		else
			@sketch = Sketch.new
			flash[:notice] = "You have not created your Sketch. Create it now."
			render 'edit'
		end
	end
end