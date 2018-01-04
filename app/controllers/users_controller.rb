class UsersController < Clearance::UsersController

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
		@user = User.find(params[:id])
	end 

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
