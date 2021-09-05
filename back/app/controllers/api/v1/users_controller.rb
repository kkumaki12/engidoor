module Api
  module V1
    class UsersController < ApiController
      def new
        @user = User.new
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json:user
        else
         render json: { message: '更新に失敗しました'}
      end
    end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def create
        user = User.new(user_params)
        user.image = "default.png"
        if user.save!
          render json: user
        else
          render json: { message: '登録できませんでした' }
        end
      end

      def ranking
        join = User.joins({ comments: :goods })
        table = join.group(:id).order('count(users.id) desc').limit(5).pluck(:id)
        rank = User.find(table)
        render json: rank
      end

      def comments_by_tag_count
        user = User.find(params[:id])
        comments = Comment.where(user_id:[user.id]).select(:question_id)
        question_id = comments.map(&:question_id)
        tags = []
        question_id.each do |q_id|
        tags << Question.find(q_id)
      end 
        result = tags.group_by{ |d| d[:tag] }
        keys = result.keys
        number = []

        keys.each do |n|
          number << result[n].count
        end
        value = keys.zip(number).to_h.keys
        render json: value
      end

      def comments_by_tag_count_values
        user = User.find(params[:id])
        comments = Comment.where(user_id:[user.id]).select(:question_id)
        question_id = comments.map(&:question_id)
        tags = []
       question_id.each do |q_id|
          tags << Question.find(q_id)
      end 
        result = tags.group_by{ |d| d[:tag] }
        keys = result.keys
        number = []

        keys.each do |n|
          number << result[n].count
        end
        value = keys.zip(number).to_h.values
        render json: value
      end

      private

      def user_params
        params.permit(:name, :email, :password, :password_confirmation, :image, :occupation, :specialty)
      end

      def logged_in_user
        unless logged_in?
          flash[:danger] = 'ログインしてください'
          redirect_to login_url
        end
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user == @user
      end
    end

      def current_user
        user = User.find_by(params[:token])
      end
    end
  end

