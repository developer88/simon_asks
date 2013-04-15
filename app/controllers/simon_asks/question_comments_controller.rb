module SimonAsks
  class QuestionCommentsController < SimonAsks::ApplicationController

     #authorize_resource class: false

    before_filter :find_question
    before_filter :find_comment, except: [:create]

    def create
      @comment = @question.comments.build(params[:comment])
      @comment.user = current_user
      authorize! :create, @comment
      if @comment.save
        respond_to do |format|
          format.html { redirect_to @question, notice: t('simon_asks.comment.was.created') }
          format.js
        end
      else
        respond_to do |format|
          format.html { render 'questions/show' }
          format.js { render js: "$('#add_question_comment.loader').hide(); $('#add_question_comment_block').show();" }
        end
      end
    end

    def edit
      authorize! :edit, @comment
    end

    def update
      authorize! :update, @comment
      if @comment.update_attributes(params[:comment])
        redirect_to question_path(@question), notice: t('simon_asks.comment.was.updated')
      else
        render :edit
      end
    end

    def destroy
      authorize! :destroy, @comment
      if @comment.destroy
        respond_to do |format|
          format.html { redirect_to @question, notice: t('simon_asks.comment.was.destroyed') }
          format.js { render js: "$('.comment-item##{@comment.id}').html('<div class=\"destroyed\">#{t('simon_asks.comment.was.destroyed')}</div>');" }
        end
      else
        respond_to do |format|
          format.html { redirect_to @question }
          format.js { render js: "$('.comment-item##{@comment.id}').show();" }
        end
      end
    end

    private

    def find_question
      @question = Question.find(params[:question_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
  end
end
