Rails.application.routes.draw do
  
  root 'posts#top' #トップ画面へのルーティング追加
  resources :posts do
    collection do
      post :confirm
    #get :topy←このルーティングは誤り
    end
  end
end
#end#追加
