Rails.application.routes.draw do
  root 'calculation#top'
  get 'calculation/top'
  get 'calculation/calculate'
  post 'calculation/calculate'
  get 'calculation/:id' => 'calculation#matchCount'
end
