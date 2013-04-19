module SimonAsks
  class QuestionsController < SimonAsks::ApplicationController
    #include SimonAsks::QuestionsHelper

    skip_authorization_check :only => [:index, :show]
    authorize_resource class: SimonAsks::Question, except: [:index, :show]    

    before_filter :find_question_by_id, only: [:show, :edit, :update, :destroy]
    before_filter :find_question_by_question_id, only: [:mark, :edit_image, :upvote, :downvote]
    #before_filter :merge_tags, only: [:update, :create]

    def index
      # TODO add option to enable this
      #@question_of_day = Question.find_by_marked(true)
      @questions = []
      if params[:tag]
        @questions = Question.tagged_with(params[:tag]).page(params[:page])
      elsif params[:query]
        @questions = Question.search(params[:query]).page(params[:page])
      else
        @questions = Question.page(params[:page])
      end
    end

    def new
      @question = Question.new
    end

    def show
      @question.increment_views!
      @related_questions = Question.related_to(@question)
      @answer = QuestionAnswer.new
    end

    def create
      @question = Question.new(params[:question])
      @question.user = current_user
      if @question.save
        redirect_to question_path(@question), notice: t('simon_asks.question.was.created')
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @question.update_attributes(params[:question])
        redirect_to question_path(@question), notice: t('simon_asks.question.was.updated')
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to questions_path
    end

    def edit_image
    end

    def upvote
      unless current_user && @question.user == current_user && current_user.voted_down_on?(@question) != true
        if current_user.voted_up_on? @question
          @question.unvote :voter => current_user, :vote => 'like'
          @minus = 1
        else
          @question.vote :voter => current_user, :vote => 'like'
        end
      else
        @error = 1
      end
    end

    def downvote
      unless current_user && @question.user == current_user && current_user.voted_up_on?(@question) != true
        if current_user.voted_down_on? @question
          @question.unvote :voter => current_user, :vote => 'bad'
          @minus = 1
        else
          @question.vote :voter => current_user, :vote => 'bad'
        end
      else
        @error = 1
      end
    end

    private

    def merge_tags
      if params[:question] && params[:question][:tag_list]
        params[:question][:tag_list] = params[:question][:tag_list].join(', ')
      end
    end

    def find_question_by_id
      @question = Question.find(params[:id])
    end

    def find_question_by_question_id
      @question = Question.find(params[:question_id])
    end
  end
end
