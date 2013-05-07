if ActiveRecord::Base.connection.table_exists? 'simon_asks_question_answers'
  ActiveAdmin.register SimonAsks::QuestionAnswer do 
    
    setup_resource object: SimonAsks::QuestionAnswer, menu: :qa

    actions :index, :show, :destroy

    filter :created_at
    filter :question
    filter :content

    index do
      resource_object = controller.resource_class
      selectable_column
      column "id", :sortable => :id do |o|
        o.id
      end
      column resource_object.human_attribute_name(:content), :sortable => :content do |obj|
        link_to truncate(obj.content, :length => 15), admin_simon_asks_question_answer_path(obj.id)
      end
      column resource_object.human_attribute_name(:question)do |obj|
        link_to obj.question.title, admin_simon_asks_question_path(obj.question.id)
      end  
      column resource_object.human_attribute_name(:user) do |obj|
        mail_to obj.user.email if obj.user
      end                        
      column I18n.t("active_admin.actions") do |obj|
       links = link_to I18n.t(:destroy), admin_simon_asks_question_answer_path(obj.id), :confirm => t('are_you_sure', :default => 'Are you sure?'), :method => :delete
      end
    end

    show do |obj|
      attributes_table do
        row :question do
          link_to obj.question.title, admin_simon_asks_question_path(obj.question.id)
        end
        row :user do
          mail_to obj.user.email if obj.user
        end
        row :comments_count
        row :content 
        row :created_at
        row :updated_at
      end
    end 

  end
end
