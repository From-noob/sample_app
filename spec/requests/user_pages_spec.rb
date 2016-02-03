require 'spec_helper'

describe 'User pages' do
  subject { page }

  describe 'signup page' do
    before { visit signup_path }

    it { should have_selector('h1', text: 'Sign up') }
    # it { should have_selector('title', text: full_title('Sign up')) }
    it { should have_selector('title', text: 'Sign up') }

    describe 'with invalid information' do
      describe 'after submission' do
        let(:submit) { 'Create my account' }

        before { click_button submit }
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end

    #  WHAT THE FUCKKKKKKKKKKKKKKKKKKKKKKKKKKKKK?
    describe 'with valid information' do
      describe 'after saving the user' do
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }

        it { should have_link('Sign out') }
      end
    end
  end

  describe 'profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
end
