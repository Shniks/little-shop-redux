# Provides access to the routes for our app.
class LittleShopApp < Sinatra::Base
  get '/invoices' do
    invoices = Invoice.all
    erb :'invoices/index', :locals => { :invoices => invoices }
  end
end
