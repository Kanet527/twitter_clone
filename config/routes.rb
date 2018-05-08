Rails.application.routes.draw do
  root to: 'tw_clones#top'
  resources :tw_clones do
    collection do
      post  :confirm
    end
  end
end
