
    class ItemsController < ApplicationController
      # 一覧表示
      def index
        @items = Item.all
      end
      
      # 新しいデータの入力フォームの表示
      def new
        @item = Item.new
      end
    
      # データの作成
      def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to items_path
        else
          render :new
        end
      end
      
      # 詳細表示
      def show
        @item = Item.find(params[:id])
      end
      
      # 編集フォームの表示
      def edit
        @item = Item.find(params[:id])
      end
    
      # データの更新
      def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
          redirect_to item_path(@item)
        else
          render :edit
        end
      end
      
      # データの削除
      def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path
      end
      
      private
      
      # ストロングパラメータ
      def item_params
        params.require(:item).permit(:name, :description, :price,) # ここに許可する属性を列挙します
      end
    end
   
    
    
    
  

