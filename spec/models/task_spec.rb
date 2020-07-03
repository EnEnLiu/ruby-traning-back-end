require 'rails_helper'

RSpec.describe Task, type: :model do
  context '建立成功' do
    it '至少標題欄有填' do
      expect(FactoryBot.build(:task)).to be_valid
    end
  end
  context '建立失敗' do
    it '標題未填' do
      task = FactoryBot.build(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include('不能為空白')
    end
  end
end
