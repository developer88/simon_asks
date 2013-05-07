if ActiveRecord::Base.connection.table_exists? 'simon_asks_questions'
  ActiveAdmin.register SimonAsks::Question do  

    setup_resource object: SimonAsks::Question, menu: :qa

    controller do

      after_filter :set_user_hook, :only => :create

      def set_user_hook
        question = SimonAsks::Question.where(:title => params[:simon_asks_question][:title]).order('created_at desc').first
        if question
          question.user = current_user
          question.save!
        end
      end

    end 

    filter :created_at
    filter :title 

    index do
      resource_object = controller.resource_class
      selectable_column
      column "id", :sortable => :id do |o|
        o.id
      end
      column resource_object.human_attribute_name(:title), :sortable => :title do |obj|
        link_to obj.title, admin_simon_asks_question_path(obj.id)
      end  
      column resource_object.human_attribute_name(:user) do |obj|
        mail_to obj.user.email if obj.user
      end                     
      column I18n.t("active_admin.actions") do |obj|
       links = link_to I18n.t(:edit), edit_admin_simon_asks_question_path(obj.id)
       links += '&nbsp;&nbsp;'.html_safe
       links += link_to I18n.t(:destroy), admin_simon_asks_question_path(obj.id), :confirm => t('are_you_sure', :default => 'Are you sure?'), :method => :delete
      end
    end  

    form do |f|
      f.actions
      display_error_messages f 
      f.inputs I18n.t("active_admin.data") do  
        f.input :title
        f.input :tag_list, as: :string, input_html: { class: 'tags', data: { pre: f.object.tag_list.sort.collect {|t| {id: t, name: t } } } }
        f.input :content
      end     
      f.actions
    end  

    show do |obj|
      attributes_table do
        row :title
        row :tag_list 
        row :user do
          mail_to obj.user.email if obj.user
        end
        row :content 
        row :created_at
        row :updated_at
      end
    end 

  end
end
