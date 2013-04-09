module SimonAsks
  class CommentsController < SimonAsks::ApplicationController
    respond_to :js

    load_and_authorize_resource class: SimonAsks::Comment

    def create
      @comment.user = current_user
      @comment.save
      respond_with(@comment)
    end

    def update
      @comment.update_attributes(params[:comment])
      respond_with(@comment)
    end
  end
end
