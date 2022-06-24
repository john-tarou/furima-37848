require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it "商品情報の全てが存在すれば保存できる" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it "商品画像が空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では保存できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明が空では保存できない" do 
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "カテゴリーの情報が空では保存できない" do
        @item.item_category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "商品の状態の情報が空では保存できない" do
        @item.item_sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it "配送料の負担の情報が空では保存できない" do
        @item.item_shipping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it "発送元の地域の情報が空では保存できない" do
        @item.item_prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it "発送までの日数の情報が空では保存できない" do
        @item.item_scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it "価格の情報が空では保存できない" do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
