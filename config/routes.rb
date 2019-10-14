Rails.application.routes.draw do
resources :books


get 'top' => 'books#top'

root :to => 'books#top'



end


