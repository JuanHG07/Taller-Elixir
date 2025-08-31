defmodule Main do
  def main() do
    placa = Util.input("Ingrese la placa del vehículo: ", :string)
    tipo_vehiculo = preguntar_tipo_vehiculo()
    peso_vehiculo = Util.input("Ingrese el peso del vehículo (toneladas): ", :number)
    tupla = determinar_tipo_vehiculo(placa, tipo_vehiculo, peso_vehiculo)
    mostrar_mensaje(tupla)
  end

  def preguntar_tipo_vehiculo() do
    tipo_vehiculo = Util.input("Ingrese el tipo de vehículo (carro/moto/camion): ", :string)
    if tipo_vehiculo in ["carro", "moto", "camion"] do
      tipo_vehiculo
    else
      Util.show_message("Tipo de vehículo no reconocido.")
      preguntar_tipo_vehiculo()
    end
  end

  def determinar_tipo_vehiculo(placa, "carro", peso), do: {placa, "carro", peso, 10000}
  def determinar_tipo_vehiculo(placa, "moto", peso), do: {placa, "moto", peso, 5000}
  def determinar_tipo_vehiculo(placa, "camion", peso),
    do: {placa, "camion", peso, 20000 + 2000 * peso}

  def determinar_tipo_vehiculo(placa, tipo, peso), do: {placa, tipo, peso, 0}

  def mostrar_mensaje(tupla) do
    Util.show_message(
      "La tarifa para el vehículo #{elem(tupla, 0)} (#{elem(tupla, 1)}) es: #{elem(tupla, 3)}"
    )
  end
end

Main.main()
