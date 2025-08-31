defmodule Main do
  def main() do
    nombre = Util.input("Ingrese el nombre del empleado: ", :string)
    salario_base = Util.input("Ingrese el salario base del empleado: ", :number)
    horas_extras = Util.input("Ingrese la cantidad de horas extras trabajadas: ", :integer)
    salario_total = calcular_salario(salario_base, horas_extras)

    salario_str = :erlang.float_to_binary(salario_total, [:compact, decimals: 2])
    Util.show_message("El salario total de #{nombre} es de $#{salario_str}")
  end

  def calcular_salario(salario_base, horas_extras) do
    # Salario base = hora_ordinaria * 160 horas
    hora_ordinaria = 10000
    salario_total = salario_base + horas_extras * hora_ordinaria * 1.5
    salario_total
  end
end

Main.main()
