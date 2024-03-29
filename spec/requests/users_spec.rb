require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Mateo Lane', photo: 'https://unsplash.com/photos/mateopic',
                        bio: 'Comedian, Italian, stylish, and part time youtuber', posts_counter: 5)
  end

  describe 'request list of all users' do
    before(:each) { get users_path(@user) }

    it 'Gives the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Does not render show template' do
      expect(response).to_not render_template(:show)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'Checks for user list info into the body' do
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end

  describe 'request to show a specific user info' do
    before(:each) { get user_path(@user) }

    it 'Gives the exact response' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'Checks for single user info into the body' do
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    end
  end
end
