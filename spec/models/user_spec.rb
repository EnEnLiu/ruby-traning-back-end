require 'rails_helper'

RSpec.describe User, type: :model do
  context '註冊成功' do
    it '所有欄位皆有內容，email不與其他用戶重複，密碼6個字以上' do
      user = User.new(
        name: 'nn',
        email: 'nn@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end
  end
  context '註冊失敗' do
    it 'name欄位是空的' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include('不能為空白')
    end
    it 'name欄位內容字數不在1-10之間' do
      user = User.new(name: '12345678910')
      user.valid?
      expect(user.errors[:name]).to include('過長（最長是 10 個字）')
    end
    it 'email欄位是空的' do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include('不能為空白')
    end
    it 'password欄位是空的' do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include('不能為空白')
    end
    it 'password欄位內容字數不在6-20之間' do
      user = User.new(password: 12345)
      user.valid?
      expect(user.errors[:password]).to include('過短（最短是 6 個字）')
    end
    it 'email與其他用戶重複' do
      User.create(
        name: 'nn',
        email: 'nn@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        name: 'nnn',
        email: 'nn@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.valid?
      expect(user.errors[:email]).to include('已經被使用')
    end
  end
end
