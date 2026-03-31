Geocoder.configure(
  # Define o serviço de busca
  lookup: :nominatim,

  http_headers: { "User-Agent" => "SistemaFretes-Mossoro-RN (clemesonsilva736@gmail.com)" },

  timeout: 5,

  units: :km,
  distances: :linear
)