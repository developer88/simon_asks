module SimonAsks
  class QuestionsController < SimonAsks::ApplicationController
    #include SimonAsks::QuestionsHelper

    skip_authorization_check :only => [:index, :show]
    authorize_resource class: SimonAsks::Question, except: [:index, :show]    

    before_filter :find_question_by_id, only: [:show, :edit, :update, :destroy]
    before_filter :find_question_by_question_id, only: [:mark, :edit_image, :upvote, :downvote]
    #before_filter :merge_tags, only: [:update, :create]
    before_filter :initialize_session
    before_filter :load_qa_tags
    before_filter :set_params

    has_widgets do |root|
      root << widget(:ac_tags)
    end    

    def index
      # TODO add option to enable this
      #@question_of_day = Question.find_by_marked(true)
      @questions = []

      if params[:tag]
        @questions = Question.tagged_with(params[:tag])
        @questions_size = @questions.size
      elsif params[:qa_search]
        @questions = Question.search(params)
        @questions_size = @questions.size
      elsif params[:show] || params[:sort]
        if params[:show]
          @questions = Question.sort(params[:show])
        else
          @questions = Question.sort(params[:sort], params[:direction])
        end
        @questions_size = @questions.size
      else
        @questions = Question
        @questions_size = Question.all.size
      end

      @questions = @questions.page(params[:page])
    end

    def new
      @question = Question.new
    end

    def show
      session[:simon_asks][:views]["question_#{@question.id}".to_sym] = true if @question.safely_increment_views!(session[:simon_asks])
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
      Opinion.calc_stat(@question.user.userable.id) if @question.user.medic?
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
      Opinion.calc_stat(@question.user.userable.id) if @question.user.medic?
    end

    private

    def set_params
      params[:direction] = 'DESC' unless params[:direction]
      params[:sort] = 'date' unless params[:sort]
    end

    def load_qa_tags
      if params[:question_tags_ids].present?
        @qa_tags = params[:question_tags_ids].split(",")
      end
    end

    def initialize_session
      session[:simon_asks] = {} unless session[:simon_asks]
      session[:simon_asks][:views] = {} unless session[:simon_asks][:views]    
    end

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
