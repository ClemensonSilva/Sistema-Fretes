# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destruindo registros existentes..."
Funcionario.destroy_all
Gerente.destroy_all # Adicionado para limpar gerentes também, se necessário
Cnh.destroy_all
Abastecimento.destroy_all
Veiculo.destroy_all
Manutencao.destroy_all
Frete.destroy_all
puts "Registros existentes destruídos."
puts "----------------------------------"

# --- Criação de CNHs ---
puts "Criando CNHs..."
cnh_gerente1 = Cnh.create!(
  numero_registro: "98765432109",
  cat_cnh: 1, # Exemplo: Categoria B
  status: 0, # Exemplo: Ativa
  primeira_cnh: "2021-03-10",
  observacoes: "Necessário o uso de óculos",
  data_expedicao: "2022-03-10",
  validade: "2027-03-10"
)

cnh_func1 = Cnh.create!(
  numero_registro: "12345678901",
  cat_cnh: 1, # Exemplo: Categoria B
  status: 0, # Exemplo: Ativa
  primeira_cnh: "2019-05-15",
  observacoes: "Não há",
  data_expedicao: "2020-05-15",
  validade: "2025-05-15"
)

cnh_func2 = Cnh.create!(
  numero_registro: "11223344556",
  cat_cnh: 2, # Exemplo: Categoria C
  status: 0,
  primeira_cnh: "2018-01-20",
  observacoes: "Dirigir com atenção",
  data_expedicao: "2019-01-20",
  validade: "2024-01-20"
)

cnh_func3 = Cnh.create!(
  numero_registro: "65432109876",
  cat_cnh: 3, # Exemplo: Categoria D
  status: 0,
  primeira_cnh: "2015-08-01",
  observacoes: "Sem restrições",
  data_expedicao: "2020-08-01",
  validade: "2025-08-01"
)
puts "#{Cnh.count} CNHs criadas."
puts "----------------------------------"

# --- Criação de Gerentes ---
puts "Criando Gerentes..."
gerente1 = Gerente.create!(
  email: "clemesilva@gmail.com",
  password: "123456",
  nome: "Francisco Silva",
  cpf: "113.456.129-80",
  regiao_atuacao: 2, # Exemplo: Nordeste
  cnh: cnh_gerente1
)

gerente2 = Gerente.create!(
  email: "mariasouza@gmail.com",
  password: "654321",
  nome: "Maria Souza",
  cpf: "223.145.789-10",
  regiao_atuacao: 1, # Exemplo: Sudeste
  cnh: Cnh.create!(
    numero_registro: "00112233445",
    cat_cnh: 1,
    status: 0,
    primeira_cnh: "2017-02-01",
    observacoes: "Uso obrigatório de lentes corretivas",
    data_expedicao: "2022-02-01",
    validade: "2027-02-01"
  )
)
puts "#{Gerente.count} Gerentes criados."
puts "----------------------------------"

# --- Criação de Funcionários ---
puts "Criando Funcionários..."
funcionario1 = Funcionario.create!(
  email: "anasilva@gmail.com",
  password: "123456",
  nome: "Ana Silva",
  cpf: "123.456.789-00",
  cargo: "Motorista",
  regiao_atuacao: 2, # Exemplo: Nordeste
  supervisor: gerente1,
  cnh: cnh_func1
)

funcionario2 = Funcionario.create!(
  email: "carloslima@gmail.com",
  password: "123456",
  nome: "Carlos Lima",
  cpf: "987.654.321-11",
  cargo: "Motorista",
  regiao_atuacao: 1, # Exemplo: Sudeste
  supervisor: gerente2,
  cnh: cnh_func2
)

funcionario3 = Funcionario.create!(
  email: "fernandagomes@gmail.com",
  password: "123456",
  nome: "Fernanda Gomes",
  cpf: "555.444.333-22",
  cargo: "Motorista",
  regiao_atuacao: 2, # Exemplo: Nordeste
  supervisor: gerente1,
  cnh: cnh_func3
)
puts "#{Funcionario.count} Funcionários criados."
puts "----------------------------------"

# --- Criação de Veículos ---
puts "Criando Veículos..."
veiculo1 = Veiculo.create!(
  placa: 'BRA-5E43',
  marca: 'Hyundai',
  modelo: 'HB20',
  ano_fabricacao: '2023-01-10',
  tipo_combustivel: 2, # Flex
  vel_max_controlada: 180.0,
  status: 1, # Ativo
  categoria_veiculo: 2, # Carro Leve
  quilometragem_km: 15200.75
)

veiculo2 = Veiculo.create!(
  placa: 'ABC-1234',
  marca: 'Ford',
  modelo: 'Cargo 816',
  ano_fabricacao: '2022-03-20',
  tipo_combustivel: 2, # Diesel
  vel_max_controlada: 120.0,
  status: 1, # Ativo
  categoria_veiculo: 1, # Caminhão
  quilometragem_km: 45000.50
)

veiculo3 = Veiculo.create!(
  placa: 'XYZ-9876',
  marca: 'Mercedes-Benz',
  modelo: 'Sprinter',
  ano_fabricacao: '2021-07-05',
  tipo_combustivel: 2, # Diesel
  vel_max_controlada: 140.0,
  status: 0, # Em Manutenção
  categoria_veiculo: 3, # Utilitário
  quilometragem_km: 30000.00
)
puts "#{Veiculo.count} Veículos criados."
puts "----------------------------------"

# --- Criação de Abastecimentos ---
puts "Criando Abastecimentos..."
Abastecimento.create!(
  tipo_combustivel: 1, # Gasolina
  data_abastecimento: "2024-06-15",
  quantidade_litros: 35.0,
  preco_litro: 5.89,
  nome_posto: "Posto Shell",
  veiculo: veiculo1
)

Abastecimento.create!(
  tipo_combustivel: 2, # Diesel
  data_abastecimento: "2024-06-10",
  quantidade_litros: 80.0,
  preco_litro: 6.20,
  nome_posto: "Posto Petrobras",
  veiculo: veiculo2
)

Abastecimento.create!(
  tipo_combustivel: 1, # Etanol
  data_abastecimento: "2024-06-18",
  quantidade_litros: 40.0,
  preco_litro: 4.05,
  nome_posto: "Posto Ipiranga",
  veiculo: veiculo1
)
puts "#{Abastecimento.count} Abastecimentos criados."
puts "----------------------------------"

# --- Criação de Manutenções ---
puts "Criando Manutenções..."
Manutencao.create!(
  veiculo: veiculo1,
  tipo: 1, # Preventiva
  descricao: "Troca de óleo e filtro de ar",
  data_agendada: "2024-07-01",
  data_entrega_veiculo: "2024-07-02",
  custo: 350.0,
  oficina: "Mecânica do Zé"
)

Manutencao.create!(
  veiculo: veiculo2,
  tipo: 1, # Corretiva
  descricao: "Reparo no sistema de freios",
  data_agendada: "2024-06-25",
  data_entrega_veiculo: "2024-06-28",
  custo: 1200.0,
  oficina: "Oficina Diesel Master"
)

Manutencao.create!(
  veiculo: veiculo3,
  tipo: 1,
  descricao: "Alinhamento e balanceamento",
  data_agendada: "2024-07-10",
  data_entrega_veiculo: "2024-07-11",
  custo: 200.0,
  oficina: "Pneus & Cia"
)
puts "#{Manutencao.count} Manutenções criadas."
puts "----------------------------------"

# --- Criação de Fretes ---
puts "Criando Fretes..."
Frete.create!(
  veiculo: veiculo1,
  funcionario: funcionario1,
  preco: 1450.0,
  origem: "Mossoró/RN",
  destino: "Natal/RN",
  data_chegada: "2024-06-10",
  data_saida: "2024-06-09",
  status: 1 # Concluído
)

Frete.create!(
  veiculo: veiculo2,
  funcionario: funcionario2,
  preco: 3200.0,
  origem: "São Paulo/SP",
  destino: "Rio de Janeiro/RJ",
  data_chegada: "2024-06-12",
  data_saida: "2024-06-11",
  status: 1 # Concluído
)

Frete.create!(
  veiculo: veiculo3,
  funcionario: funcionario3,
  preco: 2100.0,
  origem: "Fortaleza/CE",
  destino: "Recife/PE",
  data_chegada: "2024-07-05",
  data_saida: "2024-07-04",
  status: 0 # Em Andamento
)

Frete.create!(
  veiculo: veiculo1,
  funcionario: funcionario1,
  preco: 1800.0,
  origem: "Natal/RN",
  destino: "João Pessoa/PB",
  data_chegada: "2024-07-15",
  data_saida: "2024-07-14",
  status: 0 # Em Andamento
)
puts "#{Frete.count} Fretes criados."
puts "----------------------------------"

puts "Criação de seeds finalizada com sucesso!"