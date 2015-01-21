# -*- encoding: utf-8 -*-

require 'barby'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'
require "base64"

module Brcobranca
  module Boleto
    module Template
      module Html
        extend self

        def to(formato, options = {})
          barcode = Barby::Code25Interleaved.new(self.codigo_barras) 
          imagem_codigo_barras64 = Base64.encode64(barcode.to_png(width: 480, height: 50, margin: 0))
          { template: 'brcobranca/boleto.html.erb', layout: false, locals: { boleto: self, imagem_codigo_barras64: imagem_codigo_barras64 } }.merge(options)
        end
        
      end
    end
  end
end

