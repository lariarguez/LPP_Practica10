class Alimento
      # Incluye el módulo Comparable
	include Comparable

      # Se realiza para poder acceder a los atributos y cambiarlos	
	attr_accessor :nombreAlimento, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

      # Se inicializan las variables
	def initialize(nombreAlimento, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombreAlimento = nombreAlimento
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

	end 

      # Método para obtener el nombre del alimento
	def NombreAlimento
		@nombreAlimento
	end

      # Método para obtener las emisiones de gases de efecto invernadero
	def GasesEfectoInvernadero
		@gei
	end	
	
      # Método para obtener el terreno utilizado
	def TerrenoUtilizado
		@terreno
	end 

      # Método para obtener las proteinas
	def Proteinas
		@proteinas
	end

	def Lipidos
		@lipidos
	end

	def Carbo
		@carbohidratos
	end


      # Método para convertir en Kilo Calorías
      # Devuelve el valor total en Kcal teniendo en cuenta todos los componentes
	def factor_conversionKcal

		kcal = proteinas.to_f * 4
		kcal += carbohidratos.to_f * 4
		kcal += lipidos.to_f * 9
		kcal.round(2)
	end

      # Método para obtener el valor energético de un alimento
      # Devuelve el valor de la Ingesta de referencia del valor energético
	
	def ValorEnergetico
		ve = factor_conversionKcal.to_f / 2000
		ve.round(2)
	end

      # Método para obtener el alimento formateado	
	
	def to_s

		"(Por 100g o 100ml de producto IR(por 100g o 100ml de producto)Por porción de X g IR(por porción de X g de producto)\nValor energético(kj/kcal)#{Factor_ConversionKcal} #{ValorEnergetivo} #{'-'} #{'-'}\nProteínas: #{@proteinas} #{'-'} #{'-'}\nCarbohidratos: #{@carbohidratos} #{'-'} #{'-'}\nLípidos:  #{@lipidos} #{'-'} #{'-'}\nGases de Efecto Invernadero: #{@gei} #{'-'} #{'-'}\nUso de Terreno: #{@terreno} #{'-'} #{'-'}\n)"
	end

	# Método para utilizar el módulo Comparable que nos indica cómo se comportan los objetos, en este caso, el nombre de la etiqueta.
#
        def <=>(other)

		return self.ValorEnergetico <=> other.ValorEnergetico

        end

end
