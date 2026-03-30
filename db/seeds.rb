# Helper para gerar CNHs válidas seguindo o seu algoritmo
def gerar_cnh_valida
  loop do
    base = 9.times.map { rand(0..9) }.join
    
    # Cálculo do primeiro dígito (vl1)
    dsc = 0
    sum1 = 0
    9.step(1, -1).each_with_index { |w, i| sum1 += base[i].to_i * w }
    vl1 = sum1 % 11
    if vl1 >= 10
      vl1 = 0
      dsc = 2
    end

    # Cálculo do segundo dígito (vl2)
    sum2 = 0
    1.step(9, 1).each_with_index { |w, i| sum2 += base[i].to_i * w }
    rest = sum2 % 11
    vl2 = rest >= 10 ? 0 : rest - dsc
    vl2 = 0 if vl2 < 0

    cnh = "#{base}#{vl1}#{vl2}"
    return cnh if cnh.chars.uniq.count > 1 # Evita números repetidos
  end
end

# Tabela de Distâncias Reais (km)
DISTANCIAS = {
  ["Mossoró/RN", "Natal/RN"] => 280,
  ["Mossoró/RN", "Fortaleza/CE"] => 240,
  ["Mossoró/RN", "Salvador/BA"] => 1100,
  ["Mossoró/RN", "Rio de Janeiro/RJ"] => 2450,
  ["Mossoró/RN", "São Paulo/SP"] => 2750,
  ["São Paulo/SP", "Rio de Janeiro/RJ"] => 440,
  ["São Paulo/SP", "Belo Horizonte/MG"] => 590,
  ["Rio de Janeiro/RJ", "Vitória/ES"] => 520,
  ["Natal/RN", "João Pessoa/PB"] => 180,
  ["Fortaleza/CE", "Teresina/PI"] => 600
}

puts "Limpando banco de dados..."
[Frete, Abastecimento, Manutencao, Cnh, Funcionario, Veiculo].each(&:destroy_all)

# --- 1. Estrutura Hierárquica (Gerentes) ---
puts "Criando Gerência..."
gerentes = ["Ricardo Oliveira", "Luciana Costa"].map.with_index do |nome, i|
  g = Gerente.create!(
    nome: nome, email: "gerente#{i+1}@logistica.com",
    password: "password123", cpf: CPF.generate(formatted: true),
    regiao_atuacao: i
  )
  Cnh.create!(
    numero_registro: gerar_cnh_valida, cat_cnh: 1, status: 0,
    primeira_cnh: 5.years.ago, validade: 2.years.from_now, funcionario: g
  )
  g
end

# --- 2. Motoristas Profissionais ---
puts "Criando Motoristas..."
motoristas = %w[Ana Carlos Fernanda João Marcos Beatriz Paulo Julia].map do |nome|
  m = Funcionario.create!(
    nome: "#{nome} Silva", email: "#{nome.downcase}@fretes.com",
    password: "password123", cpf: CPF.generate(formatted: true),
    cargo: "Motorista", supervisor: gerentes.sample
  )
  Cnh.create!(
    numero_registro: gerar_cnh_valida, cat_cnh: rand(3..5), status: 0,
    primeira_cnh: 10.years.ago, validade: 3.years.from_now, funcionario: m
  )
  m
end

# --- 3. Frota e Autonomia ---
puts "Configurando Frota..."
# Definimos consumo (km/l) e tanque para cálculos realistas de abastecimento
dados_veiculos = [
  {m: 'Volvo', mod: 'FH 540', cat: 1, cons: 2.5, tank: 500},
  {m: 'Mercedes', mod: 'Accelo', cat: 1, cons: 4.5, tank: 150},
  {m: 'VW', mod: 'Delivery', cat: 1, cons: 5.0, tank: 150},
  {m: 'Fiat', mod: 'Fiorino', cat: 3, cons: 11.0, tank: 55},
  {m: 'Hyundai', mod: 'HR', cat: 3, cons: 9.0, tank: 80}
]

veiculos_stats = 12.times.map do
  d = dados_veiculos.sample
  v = Veiculo.create!(
    placa: "LOG-#{rand(1000..9999)}", marca: d[:m], modelo: d[:mod],
    ano_fabricacao: rand(2018..2024).years.ago, status: 1,
    categoria_veiculo: d[:cat], quilometragem_km: rand(5000..150000)
  )
  {obj: v, consumo: d[:cons], tanque: d[:tank]}
end

# --- 4. Operações de Larga Escala ---
puts "Gerando 100 Fretes com Logística de Abastecimento..."

100.times do
  rota = DISTANCIAS.keys.sample
  origem, destino = rota
  distancia = DISTANCIAS[rota]
  v_stat = veiculos_stats.sample
  v = v_stat[:obj]
  
  # Preço coerente: R$ 9.00/km para pesados, R$ 4.50/km para leves
  preco_km = v.categoria_veiculo == 1 ? 9.0 : 4.5
  preco_total = (distancia * preco_km).round(2)

  data_saida = rand(1..180).days.ago
  frete = Frete.create!(
    veiculo: v, funcionario: motoristas.sample, preco: preco_total,
    origem: origem, destino: destino, data_saida: data_saida,
    data_chegada: data_saida + (distancia/500.0).ceil.days, status: 1
  )

  # Simulação de Abastecimento Baseada na Rota
  autonomia = v_stat[:tanque] * v_stat[:consumo]
  necessidade_paradas = (distancia / (autonomia * 0.8)).ceil # Para com 20% de reserva
  
  necessidade_paradas.times do |i|
    Abastecimento.create!(
      veiculo: v, funcionario: frete.funcionario,
      data_abastecimento: data_saida + i.days,
      quantidade_litros: v_stat[:tanque] * 0.7, # Abastece 70% do tanque
      preco_litro: rand(5.75..6.30), status: 1,
      nome_posto: ["Graal", "Posto Shell", "Ipiranga", "Petrobras"].sample
    )
  end
end

puts "Gerando 20 Manutenções..."
20.times do
  Manutencao.create!(
    veiculo: veiculos_stats.sample[:obj], tipo: rand(0..1),
    descricao: ["Troca de Pneus", "Revisão Motor", "Travões"].sample,
    data_agendada: rand(1..180).days.ago, custo: rand(500..5000),
    oficina: "Mecânica Mossoró"
  )
end

puts "Seeds concluídos! #{Frete.count} fretes e #{Abastecimento.count} abastecimentos gerados."