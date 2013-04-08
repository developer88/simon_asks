ActiveAdmin.register SimonAsks::QuestionAnswer do 

  menu :parent => I18n.t("simon_asks.active_admin.q_n_a")

  actions :index, :show, :destroy

  filter :created_at
  filter :question
  filter :content
end
