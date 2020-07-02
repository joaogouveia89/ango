class MarketProductSerializer < ActiveModel::Serializer
   attributes :id, :name, :department, :price
end