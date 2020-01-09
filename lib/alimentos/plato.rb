# Clase plato que representa una lista de alimentos junto con sus cantidades
class Plato
	
	include Comparable

	attr_reader :nombrePlato, :listaAlimentos, :listaGramos


	# Constructor de la clase Plato
	def initialize(nombrePlato, listaAlimentos, listaGramos)
		@nombrePlato = nombrePlato
		@listaAlimentos = listaAlimentos
		@listaGramos = listaGramos
	end
	
	# Método que devuelve el nombre del plato
	def NombrePlato
		"Nombre del Plato: #{@nombrePlato}"
	end

	# Devuelve la lista de Alimentos
	def ListaAlimentos
		@listaAlimentos
	end

	# Devuelve la lista de Gramos
	def ListaGramos
		@listaGramos
	end
	
	# Método que devuelve los Nutrientes Totales de un plato
	def nutrientes_Totales
		nutrientes = 0
		@listaAlimentos.get_size.times do |i|
			nutrientes += @listaAlimentos[i].proteinas + @listaAlimentos[i].carbohidratos + @listaAlimentos[i].lipidos
		end
		return nutrientes
	end
	
	# Método que devuelve los Porcentaje proteínas de un plato
	def Porcentaje_Proteinas

		suma_pro = 0
		@listaAlimentos.get_size.times do |i|
			suma_pro += (@listaAlimentos[i].proteinas * @listaGramos[i]) / 100
		end
		
		return ((suma_pro/nutrientes_Totales) * 100).round(2)
	end

	# Método que devuelve los Porcentaje lípidos de un plato
	def Porcentaje_Lipidos

                suma_lipidos = 0
    
		@listaAlimentos.get_size.times do |i|
			suma_lipidos += (@listaAlimentos[i].lipidos * @listaGramos[i]) / 100
                end

                return ((suma_lipidos/nutrientes_Totales) * 100).round(2)
        end

	# Método que devuelve los Porcentaje Carbohidratos de un plato
	def Porcentaje_Carbohidratos

                suma_carbohidratos = 0
                
		@listaAlimentos.get_size.times do |i|
			suma_carbohidratos += (@listaAlimentos[i].carbohidratos * @listaGramos[i]) / 100
                end

                return ((suma_carbohidratos/nutrientes_Totales) * 100).round(2)
        end
	
	# Método que devuelve el Valor Calorico Total de un plato
	def valorCaloricoTotal

		nodo = @listaAlimentos.head
		nodo2 = @listaGramos.head
                suma_vct = 0
              
                while(nodo != nil)
			suma_vct += nodo.value.ValorEnergetico * nodo2.value / 100
                        nodo = nodo.next
			nodo2 = nodo2.next
                end

		return (suma_vct).round(2)
	end
	
	# Método que devuelve Emisiones de Gases de un plato
	def EmisionesDeGases
		nodo = @listaAlimentos.head
		nodo2 = @listaGramos.head
		suma_gei = 0
		
		while(nodo != nil)
			suma_gei += nodo.value.GasesEfectoInvernadero * nodo2.value / 100
			nodo = nodo.next
			nodo2 = nodo2.next
		end
		
		return (suma_gei).round(2)
	end 
	
	# Método que devuelve carbohidratos de un plato
	def carbohidratos

		nodo = @listaAlimentos.head
		nodo2 = @listaGramos.head
		suma_carb = 0

                while(nodo != nil)
			suma_carb += nodo.value.carbohidratos * nodo2.value / 100
                	nodo = nodo.next
			nodo2 = nodo2.next
		end

                return (suma_carb).round(2)
        end

	# Método que devuelve indice Valor Calorico de un plato
	def indiceValorCalorico
		
		if valorCaloricoTotal < 670
			return 1

		elsif valorCaloricoTotal >= 670 && valorCaloricoTotal <= 830
			return 2

		else valorCaloricoTotal > 830
			return 3
		end
	end

	# Método que devuelve indice de hidratos de carbono de un plato
	def indiceCarbono
	
		if carbohidratos < 800
			return 1

		elsif carbohidratos >= 800 && carbohidratos <= 1200
			return 2

		else carbohidratos > 1200
			return 3
		end
	end

	# Método Huella Nutricional de un plato
	def HuellaNutricional
	
		return (indiceValorCalorico + indiceCarbono)/2.0
	end

	# Método del nombre del plato
	def to_s


              	puts "Nombre Plato: #{@nombrePlato}"

		suma_vct = 0

		@listaAlimentos.get_size.times do |i|
			puts "#{@listaAlimentos[i].nombreAlimento}"
			puts @listaGramos[i]
			puts "gramos"
     		end
	end
	
	# Método comparación Valor Calorico Total
	def <=>(other)

		self.valorCaloricoTotal <=> other.valorCaloricoTotal
	end
end


# Clase Platohijo que hereda de Plato padre (class Plato)
class Platohijo < Plato
	
	include Comparable
	
	# Método que calculas las emisiones de los GEI de un plato
	def emisionesGases
 
		nodo = @listaAlimentos.head
                suma_gei = 0

                while(nodo != nil)
                        suma_gei += nodo.value.GasesEfectoInvernadero
                        nodo = nodo.next
                end

                return (suma_gei).round(2)
	end

	# Método que calcula el uso de terreno de un plato
	def metrosCuadradosTerreno
       		
                nodo = @listaAlimentos.head
                suma_terreno = 0

                while(nodo != nil)
			suma_terreno += nodo.value.terreno
                        nodo = nodo.next
                end

                return (suma_terreno).round(2)

	end
	
	# Método que imprime el plato formateado
	def to_s
		
		suma = 0
		@listaAlimentos.get_size.times do |i|
			suma += @listaAlimentos[i].ValorEnergetico
                end
		
		return (suma).round(2)

	end
	
	# Método impacto ambiental
	def impacto_ambiental
		
		return emisionesGases + metrosCuadradosTerreno
	end 

	# Método comparación impacto ambiental
	def <=> (other)

		self.impacto_ambiental <=> other.impacto_ambiental
	end
end

