class TipoPreguntaController < ApplicationController
    def index
      @tipos_pregunta = TipoPregunta.all
      render json: @tipos_pregunta
    end
  end
  
