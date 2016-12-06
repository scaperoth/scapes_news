class NewsItemsController < ApplicationController
    before_action :require_user_signed_in
    before_action :set_news_item, only: [:like, :dislike]
    
    def like
        respond_to do |format|
          if current_user.likes @news_item    
              format.json { render json: {id: @news_item.id, count: @news_item.get_likes.size}}
          else
              format.json { render json: root_path.errors, status: :unprocessable_entity }
          end
        end
    end

    def dislike
      respond_to do |format|
          if current_user.dislikes @news_item
              format.json { render json: {id: @news_item.id, count: @news_item.get_likes.size}}
          else
              format.json { render json: root_path.errors, status: :unprocessable_entity }
          end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
        @news_item = NewsItem.find(params[:news_item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_item_params
        params.require(:news_item).permit(:news_item_id)
    end
end
