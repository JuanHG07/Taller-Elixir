defmodule Main do
  def main() do
    Util.input("Ingrese su nombre: ", :string)
    {distancia, combustible} = pedir_datos()
    calcular_rendimiento(distancia, combustible)
  end

  def calcular_rendimiento(distancia, combustible) do
    if combustible > 0 do
      "El rendimiento es: #{Float.round(distancia / combustible, 2)} km/l"
      |> Util.show_message()
    else
      "Error: El combustible debe ser mayor que cero."
      |> Util.show_message()

      {distancia, combustible} = pedir_datos()
      calcular_rendimiento(distancia, combustible)
    end
  end

  def pedir_datos() do
    distancia = Util.input("Ingrese la distancia recorrida (km): ", :number)
    combustible = Util.input("Ingrese el combustible consumido (litros): ", :number)
    {distancia, combustible}
  end
end

Main.main()
