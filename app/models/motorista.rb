class Motorista < Funcionario
  belongs_to :supervisor, class_name: "Gerente", optional: true, foreign_key: "supervisor_id"

end