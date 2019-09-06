require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end


  it 'is invalid without firstname' do
    user.firstname = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without lastname' do
    user.lastname = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without unique email' do
    user1 = create(:user, email: "email1")
    user2 = build(:user, email: "email1")

    expect(user2).to_not be_valid
  end

  it 'has many tasks' do
    expect(User.reflect_on_association(:tasks).macro).to eq(:has_many)
  end

  it 'has two tasks' do
    expect(user.tasks.length).to eq(2)
  end

  it 'returns tasks due today' do
    task = user.tasks.first
    task.update(due_date: DateTime.now)
    expect(user.due_today.length).to eq(2)
  end

end
