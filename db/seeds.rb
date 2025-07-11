# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Funcionario.destroy_all
Cnh.destroy_all
Abastecimento.destroy_all
Veiculo.destroy_all
Manutencao.destroy_all


Gerente.create(
   nome: "Francisco Silva",
   cpf: "113.456.129-80",
   regiao_atuacao: 2
)



cnh = Cnh.create!(
   numero_registro: "98765432109",
   cat_cnh: 1,
   data_expedicao: "2022-03-10",
   validade: "2027-03-10")
p "#{Cnh.count} Cnhs criadas"

funcionario = Funcionario.create!(
  email: "anasilva@gmail.com",
  password: "123456",
  nome: "Ana Silva",
  cpf: "123.456.789-00",
  cargo: "Motorista",
  regiao_atuacao: 2,
  cnh: cnh)
p "#{Funcionario.count} funcionarios criados"


veiculo = Veiculo.create!(
  placa: 'BRA-5E43',
  marca: 'Hyundai',
  modelo: 'HB20',
  ano_fabricacao: '2023-01-10',
  tipo_combustivel: 3, # Flex
  vel_max_controlada: 180.0,
  status: 1,
  categoria_veiculo: 2,
  quilometragem_km: 15200.75
)
p "#{Veiculo.count} veiculos criads"

abastecimento = Abastecimento.create!(tipo_combustivel: 1,
                      data_abastecimento: "2022-03-10",
                      quantidade_litros:30.0,
                      preco_litro: 5.38,
                      nome_posto: "Santa Fé",
                      veiculo: veiculo)
p "#{Abastecimento.count} Cnhs criadas"


manutencao = Manutencao.create!(veiculo:veiculo,
 tipo: 1,
 descricao: "troca de pneus",
 data_realizacao: "2023-01-10",
 custo: 4000.0,
 oficina: "Oficina saia rodada")
p "#{Manutencao.count} Cnhs criadas"

Frete.create!(veiculo: veiculo, funcionario: funcionario,
              preco: 1450.0, origem: "Mossoró/RN", destino: "Natal/RN",
              data_chegada: "2022-03-10", data_saida: "2022-03-10",
              status: 1)
p "#{Frete.count} Cnhs criadas"
