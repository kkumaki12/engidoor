module Api
  module V1
    class GoodsController < ApiController
      before_action :set_comment

      def current_user
        user = User.find_by(params[:token])
      end

      def index
        goods = Good.where(user_id: params[:user_id])
        comment_id = goods.map(&:comment_id)
        comments = Comment.includes(:user).where(id: comment_id)
        render json: comments.as_json(include: :user)
      end

      def show
        goods = Good.where(comment_id: params[:comment_id])
        render json: goods
      end

      def create
        good = Good.create(user_id: params[:user_id], comment_id: params[:comment_id])
        good.save
      end

      def destroy
        good = Good.find_by(user_id: params[:user_id], comment_id: params[:comment_id])
        good.destroy
      end

      private

      def set_comment
        @comment = Comment.find_by(id: params[:comment_id])
      end
    end
  end
end
