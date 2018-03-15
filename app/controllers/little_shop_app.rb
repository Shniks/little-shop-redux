# Provides access to the routes for our app.
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

  get '/invoices' do
    invoices = Invoice.all
    erb :'invoices/index', :locals => { :invoices => invoices }
  end

  get '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    erb :'invoices/show', :locals => { :invoice => invoice }
  end

  get '/invoices/:id/edit' do
    invoice = Invoice.find(params[:id])
    erb :'invoices/edit', :locals => { :invoice => invoice }
  end

  put '/invoices/:id' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{params[:invoice][:id]}"
  end

  delete '/invoices/:id/delete' do
    Invoice.destroy(params[:id])
    redirect '/invoices'
  end
end
