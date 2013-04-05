module SimonAsks
  class TagsController < SimonAsks::ApplicationController
    
    #TODO Authorize?

    def index
      if params[:q].present?
        @tags = ActsAsTaggableOn::Tag.where("tags.name ILIKE ?", "%#{params[:q].downcase.to_s}%")
      else
        @tags = ActsAsTaggableOn::Tag.all
      end

      respond_to do |format|
        format.html
        format.json { render :json => @tags.collect{ |t| {:id => t.name, :name => t.name } } }
      end
    end
  end
end