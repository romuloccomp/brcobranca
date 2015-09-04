module Brcobranca
  class Engine < ::Rails::Engine
    initializer "brcobranca.assets.precompile" do |app|
      app.config.assets.precompile += %w(boleto.css carne.css)
    end
  end
end