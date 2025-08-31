defmodule Main do
  def main() do
    nombre = Util.input("Ingrese el titulo del libro: ", :string)
    cantidad = Util.input("Ingrese la cantidad de unidades disponibles: ", :integer)
    precio = Util.input("Ingrese el precio unitario: ", :number)
    valor_total = cantidad * precio

    Util.show_message(
      "El libro \"#{nombre}\" tiene #{cantidad} unidades, con un valor total de $#{valor_total}."
    )
  end
end

Main.main()
