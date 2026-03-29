#Esse algoritmo de validação foi feito com auxílio de IA a partir do algoritmo de validação do DETRAN
class CnhValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    cnh = value.to_s.gsub(/\D/, '')

    unless valid_cnh?(cnh)
      record.errors.add(attribute, (options[:message] || "não é uma CNH válida"))
    end
  end

  private

  def valid_cnh?(cnh)
    return false if cnh.length != 11 || cnh.chars.uniq.count == 1

    # Cálculo do primeiro dígito
    dsc = 0
    sum = 0
    9.step(1, -1).each_with_index { |w, i| sum += cnh[i].to_i * w }
    
    vl1 = sum % 11
    if vl1 >= 10
      vl1 = 0
      dsc = 2
    end

    # Cálculo do segundo dígito
    sum = 0
    1.step(9, 1).each_with_index { |w, i| sum += cnh[i].to_i * w }
    
    rest = sum % 11
    vl2 = rest >= 10 ? 0 : rest - dsc
    vl2 = 0 if vl2 < 0

    cnh[9..10] == "#{vl1}#{vl2}"
  end
end