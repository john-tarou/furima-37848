require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_date が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは「@」を含まないと登録ができない' do
        @user.email = 'kkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '12a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字のみだと登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
      end
      it 'passwordは英字のみだと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
      end
      it 'passwordは全角文字を含むと登録できない' do
        @user.password = '12ab英語'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
      end
      it 'passwordは「確認用」が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは「確認用」と一致しないと登録できない' do
        @user.password_confirmation = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)の苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name に全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'お名前(全角)の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name に全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'お名前(全角)の苗字は、全角(漢字、ひらがな、カタカナ)以外では登録できない' do
        @user.last_name = 'ＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name に全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'お名前(全角)の名前は、全角(漢字、ひらがな、カタカナ)以外では登録できない' do
        @user.first_name = '２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name に全角（漢字・ひらがな・カタカナ）を使用してください')
      end
      it 'お名前カナ(全角)の苗字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana に全角カタカナを使用してください')
      end
      it 'お名前カナ(全角)の名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana に全角カタカナを使用してください')
      end
      it 'お名前カナ(全角)の苗字は、全角カタカナ以外では登録できない' do
        @user.last_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana に全角カタカナを使用してください')
      end
      it 'お名前カナ(全角)の名前は、全角カタカナ以外では登録できない' do
        @user.first_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana に全角カタカナを使用してください')
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
