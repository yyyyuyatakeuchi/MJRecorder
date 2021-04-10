Rails.application.routes.draw do
  root 'calculation#top'
  get 'calculation/calculate'
end
