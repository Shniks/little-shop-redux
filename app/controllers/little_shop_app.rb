class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :welcome,:layout => :welcome
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect "/merchants"
  end

  get '/merchants' do
    merchants = Merchant.all
    erb :'merchants/index', locals: {merchants: merchants}
  end

  get '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    erb :'merchants/show', locals: {merchant: merchant}
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get "/items" do
    items = Item.all
    erb :'items/index', locals: {items: items}
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
    @merchants = Merchant.all
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

  get "/items-dashboard" do
    @item = Item.all
    erb :'items/dashboard'
  end

  get '/invoices/new' do
    erb :'invoices/new'
  end

  get '/invoices' do
    invoices = Invoice.all
    erb :'invoices/index', :locals => { :invoices => invoices }
  end

  get '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    @total_price = invoice.total_price(invoice.id)
    id = invoice.merchant_id
    @merchant = Merchant.find(id)
    erb :'invoices/show', :locals => { :invoice => invoice }
  end

  get '/invoices/:id/edit' do
    @merchants = Merchant.all
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end


  patch '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    invoice.update(params[:invoice])
    redirect "/invoices/#{params[:id]}"
  end

  delete '/invoices/:id' do
    Invoice.destroy(params[:id])
    redirect '/invoices'
  end

  get '/invoices-dashboard' do
    @invoices = Invoice.all
    erb :'invoices/dashboard'
  end

  get '/merchants-dashboard' do
    merchants = Merchant.all
    high_quantity_id = Merchant.merchant_with_highest_quantity["id"]
    highest_price_id = Merchant.merchant_with_highest_price_item["id"]
    erb :'merchants/dashboard', locals: { merchants: merchants, high_quantity_id: high_quantity_id, highest_price_id: highest_price_id }
  end

  not_found do
    status 404
    erb :"error"
  end

end
