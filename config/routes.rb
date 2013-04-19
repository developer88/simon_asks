SimonAsks::Engine.routes.draw do  

  get 'questions/tags/:tag', to: 'questions#index', as: :questions_tag
  get 'questions/show/:show', to: 'questions#index', as: :questions_list
  match 'questions/search', to: 'questions#index', as: :questions_search
  resources :questions do
    get 'mark'
    get 'edit/image', to: 'questions#edit_image'
    get 'upvote'
    get 'downvote'
    # TODO change vote methods to post
    resources :answers, controller: 'question_answers', only: [:create, :edit, :update, :destroy] do
      get 'upvote'
      get 'downvote'
      # TODO change vote methods to post
      get 'accept'
      resources :comments, controller: 'answer_comments', only: [:create, :edit, :update, :destroy]
    end
    resources :comments, controller: 'question_comments', only: [:create, :edit, :update, :destroy]
  end
  resources :comments, only: %w(create update), constraints: { format: 'js' }

  root :to => "questions#index"

end
