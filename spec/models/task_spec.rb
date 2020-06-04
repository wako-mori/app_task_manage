require 'rails_helper'

Rspec.describe Task, type: :model do
  describe '#create' do
    context 'taskを保存できる場合' do
      it 'contentがあれば保存できること' do
        expect(build(:task, explanation: nil)).to be_valid
      end

      it 'contentとexplanationがあれば保存できること' do
        expect(build(:task)).to be_valid
      end
    end

    context 'taskを保存できない場合' do
      it ' contentが空だと保存できないこと' do
        task = build(:message, content: nil)
        task.valid?
        expect(task.errors[:content]).to include("を入力してください")
      end

      it 'group_idが無いと保存できないこと' do
        task = build(:task, group_id: nil)
        task.valid?
        expect(task.errors[:group]).to include("を入力してください")
      end

      it ' user_idが無いと保存できないこと' do
        task = build(:task, user_id: nil)
        task.valid?
        expect(task.errors[:user]).to include("を入力してください")
      end
    end
  end
end