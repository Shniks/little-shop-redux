# Provides access to the routes for our app.
class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end


  get '/invoices' do
    invoices = Invoice.all
    erb :'invoices/index', :locals => { :invoices => invoices }
  end

  get "/items" do
    items = Item.all
    erb :"items/index", locals: {items: items}
  end

  get '/items/new' do
    @merchants = Merchant.all
    @items = Item.all
    erb :'items/new'
  end

  get "/items/:id" do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  post '/items' do
    item = Item.new(params[:item])
    item.save
    redirect '/items'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put "/items/:id" do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{params[:item][:id]}"
  end

  delete "/items/:id" do |id|
    Item.destroy(id.to_i)
    redirect "/items"
  end


end
