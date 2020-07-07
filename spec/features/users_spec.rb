require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe '使用者登入' do
    it '使用者登入後，只能看見自己建立的任務' do
      # u1 = FactoryBot.create(:user, name: 'u1') 
      # u2 = FactoryBot.create(:user, name: 'u2')
      # expect{
        # u1.task.create()
      # }
      # u1.create(:task, title: 'user1_task')
      # expect(user1.task.count).to be (1)
    end
  end
end


# User.first.task.count