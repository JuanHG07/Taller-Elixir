defmodule Main do
  def main() do
    nombre = Util.input("Ingrese el nombre del cliente: ", :string)
    peso_paquete = Util.input("Ingrese el peso del paquete (kg): ", :number)
    tipo_envio = preguntar_tipo_envio()

    costo_envio = calcular_costo_envio(peso_paquete, tipo_envio)

    resultado = {nombre, peso_paquete, tipo_envio, costo_envio}

    mostrar_resultado(resultado)
  end

  def preguntar_tipo_envio() do
    tipo_envio =
      Util.input(
        "Ingrese el tipo de envío (1: Económico, 2: Express, 3: Internacional): ",
        :integer
      )

    if tipo_envio in [1, 2, 3] do
      case tipo_envio do
        1 -> "Económico"
        2 -> "Express"
        3 -> "Internacional"
      end
    else
      Util.show_message("Tipo de envío no reconocido.")
      preguntar_tipo_envio()
    end
  end

  def calcular_costo_envio(peso, tipo_envio) do
    case tipo_envio do
      "Económico" ->
        peso * 5000

      "Express" ->
        peso * 8000

      "Internacional" ->
        cond do
          peso <= 5 ->
            peso * 15000

          peso > 5 ->
            peso * 12000
        end
    end
  end

  def mostrar_resultado({cliente, peso, tipo, costo}) do
    costo_str = :erlang.float_to_binary(costo * 1.0, [:compact, decimals: 0])
    peso_str = :erlang.float_to_binary(peso * 1.0, [:compact, decimals: 2])

    Util.show_message("""
    Resumen del envío:
    Cliente: #{cliente}
    Peso del paquete: #{peso_str} kg
    Tipo de envío: #{tipo}
    Costo total: $#{costo_str}
    """)
  end
end

Main.main()
