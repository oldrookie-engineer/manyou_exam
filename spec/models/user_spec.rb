require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      email: 'aa@bb.com'
    )
  end
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'emailが空ならバリデーションが通らない' do
    user = User.new(email: '')
    expect(user).not_to be_valid
  end
end
