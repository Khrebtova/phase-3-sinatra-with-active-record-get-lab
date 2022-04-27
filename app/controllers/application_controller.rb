class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
 

  get '/' do
    'Hello World! its baking time!'
  end

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end 

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get "/baked_goods" do 
    baked_goods = BakedGood.all
    baked_goods.to_json
  end

  get "/baked_goods/by_price" do
    baked_goods = BakedGood.order(price: :desc)
    baked_goods.to_json
  end

  # get '/baked_goods/:id' do
  #   baked_good = BakedGood.find(params[:id])
  #   baked_good.to_json(include: {bakery: {only: :name}})
  # end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.order(:price).last
    baked_good.to_json
  end

end
