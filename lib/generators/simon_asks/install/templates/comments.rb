# include necessary helpers
#require 'mdfile/active_admin/custom_resources_helper'
#::ActiveAdmin::DSL.send(:include, Mdfile::ActiveAdmin::CustomResourcesHelper)

if ActiveRecord::Base.connection.table_exists? 'simon_asks_comments'
  ActiveAdmin.register SimonAsks::Comment do  

    setup_resource object: SimonAsks::Comment, menu: :qa

    actions :index, :show, :destroy

    filter :created_at
    filter :state, as: :select, collection: proc{ SimonAsks::Comment.statuses }
    filter :content
    filter :owner_type, as: :select, collection: %w{SimonAsks::QuestionAnswer SimonAsks::Question}

    index do
      resource_object = controller.resource_class
      selectable_column
      column "id", :sortable => :id do |o|
        o.id
      end
      column resource_object.human_attribute_name(:content), :sortable => :content do |obj|
        link_to truncate(obj.content, :length => 15), admin_simon_asks_comment_path(obj.id)
      end
      column :owner_type
      column resource_object.human_attribute_name(:user) do |obj|
        mail_to obj.user.email if obj.user
      end                        
      column I18n.t("active_admin.actions") do |obj|
       links = link_to I18n.t(:destroy), admin_simon_asks_comment_path(obj.id), :confirm => t('are_you_sure', :default => 'Are you sure?'), :method => :delete
      end
    end

    show do |obj|
      attributes_table do
        row :owner_type
        row :user do
          mail_to obj.user.email if obj.user
        end
        row :state
        row :content 
        row :created_at
        row :updated_at
      end
    end

  end
end
