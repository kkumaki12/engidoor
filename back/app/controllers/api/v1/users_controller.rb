module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: %i[edit update show correct_user]
      before_action :create_array_by_tag, only: %i[comments_by_tag_count comments_by_tag_count_values]
      
      def new
        @user = User.new
      end

      def edit; end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: { message: '更新に失敗しました' }
        end
      end

      def show
        render json: @user
      end

      def create
        user = User.new(user_params)
        user.image = 'default.png'
        if user.save!
          render json: user
        else
          render json: { message: '登録できませんでした' }
        end
      end

      def good_ranking
        joined_table = User.joins({ comments: :goods })
        table = joined_table.group(:id).ranking
        rank = User.find(table)
        render json: rank
      end

      def bestanswer_ranking
        joined_table = User.joins({ questions: :best_answer })
        table = joined_table.group(:id).ranking
        rank = User.find(table)
        render json: rank
      end

      def comments_by_tag_count
        value = @keys.zip(@number).to_h.keys
        render json: value
      end

      def comments_by_tag_count_values      
        value = @keys.zip(@number).to_h.values
        render json: value
      end

      def create_array_by_tag
        @user = User.find(params[:id])
        comments = Comment.post_question(@user.id)
        question_id = comments.map(&:question_id)
        add_list(question_id)
        result = @tags.group_by { |d| d[:tag] }
        @keys = result.keys
        @number = []

        @keys.each do |n|
          @number << result[n].count
        end
        
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def add_list(question_id)
        @tags = []
        question_id.each do |q_id|
          @tags << Question.find(q_id)
        end
      end

      def user_params
        params.permit(:name, :email, :password, :password_confirmation, :image, :occupation, :specialty, :introduction)
      end

      def logged_in_user
        unless logged_in?
          flash[:danger] = 'ログインしてください'
          redirect_to login_url
        end
      end

      def correct_user
        redirect_to(root_url) unless current_user == @user
      end
    end

    def current_user
      user = User.find_by(params[:token])
    end
  end
end
