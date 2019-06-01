# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  describe 'GET #new' do
    context 'for authenticated user' do
      before do
        sign_in create(:user)
      end

      it 'should not render sign in page' do
        get :new
        assert_redirected_to root_path
      end
    end

    context 'for unauthenticated user' do
      it 'should render sign in page' do
        get :new
        assert_template :new
        assert_response :success
      end
    end
  end

  describe 'POST #create' do
    it 'should allow sign in for correct credentials' do
      user = create(:user)
      expect do
        post :create, params: {
          user: { email: user.email, password: user.password }
        }
      end.to change { subject.current_user }.from(nil).to(user)
      assert_redirected_to root_path
    end

    it 'should not allow sign in for wrong credentials' do
      post :create, params: {
        user: { email: 'wrong@example.com', password: 'wrong pass' }
      }
      assert_response :success
      assert_template :new
      expect(subject.current_user).to eq(nil)
    end

    it 'should not allow more than one sign in' do
      user = create(:user)
      post :create, params: {
        user: { email: user.email, password: user.password }
      }
      expect do
        user2 = create(:user)
        post :create, params: {
          user: { email: user2.email, password: user2.password }
        }
      end.not_to(change { subject.current_user })
    end
  end

  describe 'DELETE #destroy' do
    context 'for authenticated user' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'should allow sign out' do
        expect { delete :destroy }.to(
          change { subject.current_user }.from(@user).to(nil)
        )
        assert_redirected_to(root_path)
      end
    end

    context 'for unauthenticated user' do
      it 'should allow sign out' do
        expect { delete :destroy }.not_to(change { subject.current_user })
        assert_redirected_to(root_path)
      end
    end
  end
end
