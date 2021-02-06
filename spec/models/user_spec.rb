require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録成功' do
      it 'nickname/email/password/password_confirmation/first_name/last_name_first_name_katakana/last_name_katakana/birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailは@を含めば登録できる' do
        @user.email = "test@test.com"
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = "aaaaa1"
        @user.password_confirmation = "aaaaa1"
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.first_name = "山田"
        @user.last_name = "一郎"
        expect(@user).to be_valid
      end
      it 'first_name_katakanaとlast_name_katakanaがカタカナであれば登録できる' do
        @user.first_name_katakana = "ヤマダ"
        @user.last_name_katakana = "イチロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複するemailが存在すると登録できない' do
        @user_first = FactoryBot.create(:user)
        @user.email = @user_first.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = "aaaa1"
        @user.password_confirmation = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英数字混合じゃないと登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = "ichiro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'first_name_katakanaがカタカナでないと登録できない' do
        @user.first_name_katakana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'last_name_katakanaがカタカナでないと登録できない' do
        @user.last_name_katakana = "一郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end