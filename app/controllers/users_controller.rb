class UsersController < Clearance::UsersController
	before_action :find_user, only: [:show, :edit, :update]

	def index
	end

	def create
		user = User.new(user_params) 
		if user.save 
			 sign_in user
      		 redirect_to "/"
		else
			redirect_to "/sign_up"
		end
	end

	def show 
		@booking = Booking.includes(:listing).where(user_id: current_user.id)
	end 

	def edit
		
	end

	def update
		if current_user.id == @user.id 
			updated_params = remove_password(user_params)
			@user.update(updated_params)
			redirect_to user_path(@user.id)
		else
			redirect_to "/"
		end

	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :avatar, :remove_avatar)
	end

	def find_user
		@user = User.find(params[:id])
	end

	def remove_password(hash)
			if hash["password"] == ""
				hash.delete("password")
			end
			hash
	end

end
