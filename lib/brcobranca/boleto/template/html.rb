# -*- encoding: utf-8 -*-

require 'barby'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'
require 'base64'

module Brcobranca
  module Boleto
    module Template
      module Html
        extend self

        def layout(options = {})
          boletos = options.delete(:boletos) || [self]
          modelo = options.delete(:modelo) || 'simples'
          is_pdf = options.has_key?(:pdf)
          if is_pdf
            options[:encoding] = "UTF-8"
            options[:margin] = { top: 0, bottom:0, left: 0, right: 0 } if modelo == 'carne'
          end
          { template: "brcobranca/#{modelo}.html.erb", layout: false, locals: { is_pdf: is_pdf, boletos: boletos } }.merge(options)
        end

        def imagem_codigo_barras64
          barcode = Barby::Code25Interleaved.new(self.codigo_barras)
          Base64.encode64(barcode.to_png(width: 480, height: 50, margin: 0))
        end

      end
    end
  end
end

