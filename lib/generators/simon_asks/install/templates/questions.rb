ActiveAdmin.register SimonAsks::Question do  

  menu :parent => I18n.t("simon_asks.active_admin.q_n_a")

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
  filter :content 
  filter :marked

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
    errors_count = f.object.errors.size
    errors = f.object.errors.full_messages
    if errors_count > 0
      f.inputs I18n.t("active_admin.errors") do
        content_tag(:li, errors.join('<br/>').html_safe, class: 'errors_messages')
      end
    end
    f.inputs I18n.t("active_admin.data") do  
      f.input :title
      f.input :tag_list, as: :string
      f.input :content
      f.input :image
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
      row :image do
        image_tag(obj.image.file.to_s) if obj.image && !obj.image.file.blank?
      end
      row :created_at
      row :updated_at
    end
  end 

end
