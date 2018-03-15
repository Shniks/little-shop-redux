class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect '/merchants'
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
    merchant = Merchant.find(params[:id])
    erb :'merchants/edit', locals: {merchant: merchant}
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect '/merchants/#{params[:merchant][:id]}'
  end

  delete '/merchants/:id/delete' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    items = Item.all
    erb :'items/index', locals: {items: items}
  end

  get '/invoices' do
    invoices = Invoice.all
    erb :'invoices/index', :locals => { :invoices => invoices }
  end
end
