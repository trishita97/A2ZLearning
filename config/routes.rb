Rails.application.routes.draw do
  root to: 'questions#index'
  get '/ask', to: 'questions#ask'
  post '/questions', to: 'questions#create'
  get '/questions/:id', to: 'questions#show', as: 'question_detail'
  post '/questions/:id', to: 'answers#create'
  get '/search', to: 'questions#search'
  get '/search/:tag', to: 'questions#search_by_tag'
  get '/myquestions', to: 'questions#myquestions'
  get '/answered', to: 'questions#answered'
  get '/liked', to: 'questions#liked'
  get '/commented', to: 'questions#commented'
  get '/leaderboard', to: 'profiles#leaderboard'

  
  resources :profiles
  resources :comments
  post '/likes/:id', to: 'likes#create', as: 'like_detail'
  delete '/likes/:id', to: 'likes#destroy', as: 'like_destroy'
  post '/comments/:id', to: 'comments#create', as: 'answer_detail'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
