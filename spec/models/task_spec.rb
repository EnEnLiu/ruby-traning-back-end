require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '新增、修改'do
    context '成功' do
      it '至少標題欄有填' do
        expect(build(:task)).to be_valid
      end
    end
    context '失敗' do
      it '標題未填' do
        task = build(:task, title: nil)
        task.valid?
        expect(task.errors[:title]).to include('不能為空白')
      end
    end
  end
end
