#データベースに異常発生で、やり直し202210061219
Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index' #prototypeコントローラーのindexアクションをコマンドで追加したら自動生成されてた
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  #indexアクション追加202210061445 + #showアクション追加202210061627 + #editとupdateアクション追加202210062054 + #destroyアクション追加202210062335
    resources :comments, only: :create  #resourcesを用いて、commentコントローラーで設定したcreateアクションに対するルーティングを記述202210070305
  end
  resources :users, only: :show
end


#rails routes でアクション確認 最新：202210061632
# Prefix          Verb          URI Pattern                                                                       Controller#Action
# prototypes_index GET    /prototypes/index(.:format)                                                              prototypes#index
# root             GET    /                                                                                        prototypes#index
# prototypes       GET    /prototypes(.:format)                                                                    prototypes#index
#                 POST    /prototypes(.:format)                                                                    prototypes#create
# new_prototype    GET    /prototypes/new(.:format)                                                                prototypes#new
# prototype        GET    /prototypes/:id(.:format)                                                                prototypes#show



#rails routes でアクション確認 最新：202210062056
# Prefix          Verb          URI Pattern                                                                       Controller#Action
# prototypes_index GET    /prototypes/index(.:format)                                                              prototypes#index
# root             GET    /                                                                                        prototypes#index
# prototypes       GET    /prototypes(.:format)                                                                    prototypes#index
#                 POST    /prototypes(.:format)                                                                    prototypes#create
# new_prototype    GET    /prototypes/new(.:format)                                                                prototypes#new
# edit_prototype   GET    /prototypes/:id/edit(.:format)                                                           prototypes#edit
# prototype        GET    /prototypes/:id(.:format)                                                                prototypes#show
#                  PATCH  /prototypes/:id(.:format)                                                                prototypes#update
#                  PUT    /prototypes/:id(.:format)                                                                prototypes#update

#rails routes でアクション確認 最新：202210062344
# Prefix          Verb          URI Pattern                                                                       Controller#Action
# prototypes_index GET    /prototypes/index(.:format)                                                              prototypes#index
# root             GET    /                                                                                        prototypes#index
# prototypes       GET    /prototypes(.:format)                                                                    prototypes#index
#                  POST   /prototypes(.:format)                                                                    prototypes#create
# new_prototype    GET    /prototypes/new(.:format)                                                                prototypes#new
# edit_prototype   GET    /prototypes/:id/edit(.:format)                                                           prototypes#edit
# prototype        GET    /prototypes/:id(.:format)                                                                prototypes#show
#                  PATCH  /prototypes/:id(.:format)                                                                prototypes#update
#                  PUT    /prototypes/:id(.:format)                                                                prototypes#update
#                  DELETE /prototypes/:id(.:format)                                                                prototypes#destroy


#rails routes でアクション確認 最新：202210070315
# Prefix          Verb          URI Pattern                                                                       Controller#Action
# prototypes_index GET    /prototypes/index(.:format)                                                              prototypes#index
# root             GET    /                                                                                        prototypes#index
# prototypes       GET    /prototypes(.:format)                                                                    prototypes#index
#                  POST   /prototypes(.:format)                                                                    prototypes#create
# new_prototype    GET    /prototypes/new(.:format)                                                                prototypes#new
# edit_prototype   GET    /prototypes/:id/edit(.:format)                                                           prototypes#edit
# prototype        GET    /prototypes/:id(.:format)                                                                prototypes#show
#                 PATCH   /prototypes/:id(.:format)                                                                prototypes#update
#                  PUT    /prototypes/:id(.:format)                                                                prototypes#update
#                 DELETE  /prototypes/:id(.:format)                                                                prototypes#destroy
# controller_index POST   /controller(.:format)                                                                    controller#create







