module SimonAsks
  module ApplicationHelper

    def paginator collection, options = {}
      if defined?(:paginate) && collection.respond_to?(:current_page)
        paginate collection, options
      end
    end

  end
end
