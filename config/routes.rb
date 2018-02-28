Rails.application.routes.draw do

  devise_for :users , controllers: { :registrations => 'users/registrations' , :sessions => 'users/sessions'}
  devise_for :admins


  root 'root#index'
  get 'videos/:id', to: 'root#show_video' , as: 'show_video'
  namespace 'application_process' do
      get '', to: 'dashboard#index', as: '/'
      get 'status', to: 'applications#show_status' , as: 'status'
        resources :applications do
          resources :passports
          collection do
           get 'submit'
          end
        end
      get  'create', to: 'applications#create', as: 'create_application'
      get 'status' , to: 'applications#show_status' , as: 'show_status'
      get 'editapplication' , to: 'applications#edit_application' , as: 'edit_application'
  end

  namespace :frontend do
    resources :contact_forms , only: [:new , :create]
    resources :posts , only: [:index , :show]
    resources :conference_documents , only: [:index]

    get 'processclosed' , to: 'exception#process_closed' , as: 'process_closed'
    get 'agenda' , to: 'days#index' , as:  'agenda'
    resources :partners , :only => [:index]
    resources :organizers , :only=> [:index , :show] do
      collection do
        get 'team'
        get 'advisers'
        get 'chairs'
      end
    end
    get 'visas' ,  to: 'pages#visas' , as: 'visa'
    get 'transportation' ,  to: 'pages#transportation' , as: 'transportation'
    get 'accommodation',  to: 'pages#accommodation' , as: 'accommodation'

  end

  namespace :admin do
         root 'admin_index#index'

         resources :app_configs do
           get 'app_process_edit', to: 'app_configs#edit_app_process' , as: 'edit_app_process'
           post 'toggle_process', to: 'app_configs#toggle_process', as: 'toggle_process'
           post 'reset_process', to: 'app_configs#reset_process', as: 'reset_process'
         end

         resources :days do
           resources :events
         end
         resources :applications
         get 'accept_application/:id', to: 'applications#accept', as:'accept_application'
         get 'deny_application/:id', to: 'applications#deny', as:'deny_application'
         resources :conference_documents
         resources :partners
         resources :organizers
         resources :pages


         mount Ckeditor::Engine => '/ckeditor'
  end





end
