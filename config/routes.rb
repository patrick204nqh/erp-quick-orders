Erp::QuickOrders::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :backend, module: "backend", path: "backend/quick_orders" do
      resources :orders do
        collection do
          post 'list'
          get 'order_details'
          put 'set_status_pending'
          put 'set_status_confirmed'
          put 'set_status_done'
          put 'set_status_canceled'
        end
      end
    end
  end
end