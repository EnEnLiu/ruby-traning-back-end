require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  let(:user){create(:user)}
  let(:task){create(:task)}

  before do
    visit root_path
    click_link I18n.t('navbar.log-in')
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on I18n.t('users.sign-in')
  end

  describe '任務CRUD' do
    it '可以新增' do
      visit new_task_path
      expect {
        fill_in I18n.t('tasks.title'), with: 'abc'
        expect(page).to have_content 'abc'
      }
    end
    it '任務排序依新增時間，最新的會在最上面' do
      task2 = FactoryBot.create(:task, title: 'task2')
      expect(Task.first.title).to eq 'task2'
    end
    it '可以修改' do
      visit edit_task_path(task)
      expect {
        fill_in I18n.t('tasks.title'), with: 'abc123'
        expect(page).not_to have_content 'abc'
        expect(page).to have_content 'abc123'
      }
    end
    it '可以刪除' do
      expect{
        click_on I18n.t('tasks.delete')
        expect(find('#task-delete')['data-confirm']).to be '確定要刪除？'
      }
    end
  end

end


