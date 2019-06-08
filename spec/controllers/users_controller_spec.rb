require 'rails_helper'

#render_template
#redirect_to
#have_http_status #I'm A Teapot!!!

RSpec.describe UsersController, type: :controller do
  
  #CREATE 
  #new
  #create
  describe "CRUD: CREATE" do
    context 'GET #new' do
      it 'renders sign up' do
        get :new
        expect(response).to render_template('new')
        expect(response).to have_http_status(200)
      end
    end
    
    context 'POST #create' do
      it 'redirects user profile' do
        post :create, params: { user: { username: 'profile', password: 'password' } }  
        expect(response).to redirect_to('show')
        expect(response).to have_http_status(200)
      end

      it "rejects invalid params" do
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

    end

    #READ 
    #show
    #index

    context "READ #index" do
      it "shows you the registry" do
        expect(response).to render_template('index')
      end
    end

    context "READ #show" do
      it "render the user's profile" do
        expect(response).to render_template('show')
      end
      it "redirects to the index if the user does not exist" do 
        expect(response).to redirect_to('index')
      end
    end

    #UPDATE
    #edit
    #update
    # context "UPDATE #edit" do
    #   it "render the update profile page" do
    #     expect()
    # end
  end
  #DELETE
  #destroy

end
      ##session
      # it "rejects an existing username" do
      #   expect(response).to render_template('new')
      #   expect(flash[:errors]).to be_present
      # end

      # it "rejects an invalid password" do
      #   expect(response).to render_template('new')
      #   expect(flash[:errors]).to be_present
      # end