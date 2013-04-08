ActiveAdmin.register SimonAsks::Comment do  

  menu :parent => I18n.t("simon_asks.active_admin.q_n_a")

  actions :index, :show, :destroy

  filter :created_at
  filter :state, as: :select, collection: SimonAsks::Comment.statuses
  filter :content
  
end
