require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe '使用者登入' do
    it '使用者登入後，只能看見自己建立的任務' do
      u1 = build(:user, name: 'u1')
      u2 = build(:user, name: 'u2')
      expect{
        5.times {u1.task.build(:task)}
        3.times {u2.task.build(:task)}
        expect(u1.task.count).to eq (5)
        expect(u2.task.count).to eq (3)
      }
    end
  end
end
