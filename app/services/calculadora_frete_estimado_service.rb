class CalculadoraFreteEstimadoService
  FATOR_TORTUOSIDADE = 1.25 
  # TODO usar preço média do preço do combustível usado pelo veículo para calculo do preço base do KM
  PRECO_BASE_POR_KM = 5.50 

  def self.call(origem_completa, destino_completo)
    coord_origem = Geocoder.coordinates("#{origem_completa}, Brasil")
    coord_destino = Geocoder.coordinates("#{destino_completo}, Brasil")

    return nil unless coord_origem && coord_destino

    distancia_reta = Geocoder::Calculations.distance_between(coord_origem, coord_destino)
    
    distancia_estimada = distancia_reta * FATOR_TORTUOSIDADE

    {
      distancia_km: distancia_estimada.round(1),
      preco_sugerido: (distancia_estimada * PRECO_BASE_POR_KM).round(2)
    }
  end
end