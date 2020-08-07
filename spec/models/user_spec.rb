require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    let(:user) { build(:user)}  # user.new

    # To buld random user use 
    # let(:user) { build(:random_user)}  # user.new
    # let(:user) { build(:random_user, first_name: 'jane')}  # user.new
    
    
    # let(:user) { create(:user)} # User.create

    it 'ensures first name presence' do 
      # user = User.new(last_name: 'Last', email: 'test@example.com').save
      user.first_name = nil
      # expect(user).to eq(false)
      expect(user.save).to eq(false)
    end

    it 'ensures last name presence' do 
      # user = User.new(first_name: 'First', email: 'test@sample.com').save 
      user.last_name = nil
      # expect(user).to eq(false)
      expect(user.save).to eq(false)
    end

    it 'ensures email presence' do 
      # user = User.new(first_name: 'First', last_name: 'Last').save 
      
      user.email = nil 
      # expect(user).to eq(false)
      expect(user.save).to eq(false)
    end

    it 'should save successfully' do
      # user = User.new(first_name: 'First', last_name: 'Last', email: 'test@sample.com').save
      expect(user.save).to eq(true)
    end
  end

  context 'scope tests' do 
    
    # let (:params) { {first_name: 'First', last_name: 'Last', email: 'test@example.com'} }

    # before(:each) do 
    #   User.new(params).save 
    #   User.new(params).save 
    #   User.new(params.merge(active: true)).save 
    #   User.new(params.merge(active:false)).save 
    #   User.new(params.merge(active:false)).save 
    # end

    let(:users) { create_list(:random_user, 5)}

    before(:each) do 
      users.last(2).map { |u| u.update(active: false)}
    end

    it "should return active users" do 
      expect(User.active_users.size).to eq(3)
    end

    it "should return inactive users" do 
      expect(User.inactive_users.size).to eq(2)
    end
  end
end
