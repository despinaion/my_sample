require 'rails_helper'
describe UsersController, :type => :controller do
		before do
		@user = FactoryGirl.create(:user)
		@user_second = User.create!(email: 'depi@hotmail.com', password: 'depidepi')
		end
	describe 'Get #show' do
		context 'User is logged in' do
			before do
				sign_in @user
			end
			it 'loads correct user details' do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
		end
		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: @user.id
				expect(response).to redirect_to('/login')
			end
		end
		context 'User can only see own show page' do
			before do
				sign_in @user
			end
			it 'cannot see others users show page' do
				get :show, id: @user_second.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end
	end
end
