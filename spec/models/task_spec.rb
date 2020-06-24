require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "使用者可以" do
  it "可新增自己的任務"
  it "使用者登入後，只能看見自己建立的任務"
  it "可設定任務的開始及結束時間"
  it "可設定任務的優先順序（高、中、低）"
  it "可設定任務目前的狀態（待處理、進行中、已完成）"
  it "可依狀態篩選任務"
  it "可以任務的標題、內容進行搜尋"
  it "可為任務加上分類標籤"
  it "任務列表，並可依優先順序、開始時間及結束時間等進行排序"
  it "使用者的管理功能"
end
