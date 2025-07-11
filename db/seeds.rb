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

funcionario = Funcionario.create!(
   nome: "Ana Silva",
   cpf: "123.456.789-00",
   cargo: "Motorista", 
   regiao_atuacao: 2,
   supervisor_id: nil )



Gerente.create(
   nome: "Francisco Silva",
   cpf: "113.456.129-80",
   regiao_atuacao: 2
)

p "#{Funcionario.count} funcionarios criados"


Cnh.create!(
   numero_registro: "98765432109",
   cat_cnh: 1,
   data_expedicao: "2022-03-10",
   validade: "2027-03-10",
   funcionario: funcionario  )

   p "#{Cnh.count} Cnhs criadas"
