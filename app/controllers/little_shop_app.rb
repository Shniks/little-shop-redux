class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get "/items" do
    items = Item.all
    erb :"items/index", locals: {items: items}
  end

end
