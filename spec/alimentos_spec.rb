RSpec.describe Alimentos do
  it "has a version number" do
    expect(Alimentos::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
end


RSpec.describe Alimento do

        before :each do

                @carnedevaca = Alimento.new('Carne de vaca', 21.1, 0.0, 3.1, 50.0, 164.0)
                @carnecordero = Alimento.new('Carne de cordero', 18.0, 0.0, 17.0, 20.0, 185.0)
                @camarones = Alimento.new('Camarones', 17.6, 1.5, 0.6, 18.0, 2.0)
                @chocolate = Alimento.new('Chocolate', 5.3, 47.0, 30.0, 2.3, 3.4)
                @salmon = Alimento.new('Salmón', 19.9, 0.0, 13.6, 6.0, 3.7)
                @cerdo = Alimento.new('Cerdo', 21.5, 0.0, 6.3, 7.6, 11.0)
                @pollo = Alimento.new('Pollo', 20.6, 0.0, 5.6, 5.7, 7.1)
                @queso = Alimento.new('Queso', 25.0, 1.3, 33.0, 11.0, 41.0)
                @cerveza = Alimento.new('Cerveza', 0.5, 3.6, 0.0, 0.24, 0.22)
                @lechedevaca = Alimento.new('Leche de vaca', 3.3, 4.8, 3.2, 3.2, 8.9)
                @huevos = Alimento.new('Huevos', 13.0, 1.1, 11.0, 4.2, 5.7)
                @cafe = Alimento.new('Café', 0.1, 0.0, 0.0, 0.4, 0.3)
                @tofu = Alimento.new('Tofu', 8.0, 1.9, 4.8, 2.0, 2.2)
                @lentejas = Alimento.new('Lentejas', 23.5, 52.0, 1.4, 0.4, 3.4)
                @nuez = Alimento.new('Nuez', 20.0, 21.0, 54.0, 0.3, 7.9)
		
		@hombre = [@pollo, @nuez, @huevos]
                @mujer = [@salmon, @nuez, @cerveza]

               	def ImpactoAmbientalHombre(alimentos)

                    calorias = 0
                    proteinas = 0
                    alimentos.each do | obj |
                       calorias += obj.ValorEnergetico()
                       proteinas += obj.Proteinas()
                    end

		    puts "Impacto Ambiental del Hombre con #{(calorias/30.0).round(2)}% CDR Kcal, y proteinas #{proteinas}g/54g"
		end


           
		def ImpactoAmbientalMujer(alimentos)
                    calorias = 0
                    proteinas = 0
                    alimentos.each do | obj |
                       calorias += obj.ValorEnergetico()
                       proteinas += obj.Proteinas()
		
	   	    end

                      puts "Impacto Ambiental de la Mujer con #{(calorias/23.0).round(2)}% CDR Kcal, y proteinas #{proteinas}g/41g"
                end

		@nodo_chocolate = Node.new(@chocolate, nil, nil)
		@nodo_lentejas = Node.new(@lentejas, nil, @nodo_chocolate)

                @lista_prueba = List.new()
		@lista_prueba2 = List.new()

		@lista_prueba2.insert_head(@lentejas)
		@lista_prueba2.insert_head(@chocolate)


		@dieta_española = List.new()
		@dieta_española.insert_tail(@queso)
		@dieta_española.insert_tail(@camarones)
		@dieta_española.insert_tail(@carnecordero)
		
		@dieta_vasca = List.new()
		@dieta_vasca.insert_tail(@carnedevaca)
		@dieta_vasca.insert_tail(@cerveza)
		@dieta_vasca.insert_tail(@lechedevaca)

		@dieta_vegetaria = List.new()
		@dieta_vegetaria.insert_tail(@lechedevaca)
		@dieta_vegetaria.insert_tail(@huevos)
		@dieta_vegetaria.insert_tail(@tofu)

		@dieta_vegetariana = List.new()
		@dieta_vegetariana.insert_tail(@nuez)
		@dieta_vegetariana.insert_tail(@tofu)
		@dieta_vegetariana.insert_tail(@chocolate)

		@dieta_locuraporlacarne = List.new()
		@dieta_locuraporlacarne.insert_tail(@carnecordero)
		@dieta_locuraporlacarne.insert_tail(@cerdo)
		@dieta_locuraporlacarne.insert_tail(@carnedevaca)

		@lista_gra = List.new()
		@lista_gra.insert_tail(50)
		@lista_gra.insert_tail(20)
		@lista_gra.insert_tail(30)

		@listaAli = List.new()
		@listaAli.insert_head(@nuez)
		@listaAli.insert_head(@queso)
		@lista_gramos = List.new()
		@lista_gramos.insert_head(50)
		@lista_gramos.insert_head(60)
		@plato = Plato.new("Vegetariano", @listaAli, @lista_gramos)
	      	@plato2 = Platohijo.new("Vegetariano", @listaAli, @lista_gramos)	
		@plato_español = Plato.new("Español", @dieta_española, @lista_gra)
		@plato_vasco = Plato.new("Vasco", @dieta_vasca, @lista_gra)
		@plato_vegetaria = Plato.new("Vegetaria", @dieta_vegetaria, @lista_gra)
                @plato_vegetariana = Plato.new("Vegetariana", @dieta_vegetariana, @lista_gra)
		@plato_carne = Plato.new("Locuraporlacarne", @dieta_locuraporlacarne, @lista_gra)
		
		@platohijo_español = Platohijo.new("Español", @dieta_española, @lista_gra)
		@platohijo_vasco = Platohijo.new("Vasco", @dieta_vasca, @lista_gra)

		@lista_platos = List.new()
			
		@MenuDietetico = [@plato_español, @plato_vasco, @plato_vegetaria]
		@MenuPrecios = [20.0, 15.5, 13.2]

		

		def gasesefectoinvernadero(dieta)
		 	
			nodo = Node.new(nil, nil, nil)
			nodo = dieta.head
			sum_gei = 0
			i = 0
			while(dieta.get_size - 1 >= i)
				sum_gei += nodo.value.GasesEfectoInvernadero
				nodo = nodo.next
				i = i + 1
			end
			
			return sum_gei.round(2)
			
		end

		def usodeterreno(dieta)

                        nodo = Node.new(nil, nil, nil)
                        nodo = dieta.head
                        sum_terreno = 0
                        i = 0
                        while(dieta.get_size - 1 >= i)
				sum_terreno += nodo.value.TerrenoUtilizado
                                nodo = nodo.next
                                i = i + 1
                        end

			return sum_terreno.round(2)

                end

	end

	describe "Alimento" do
		it "Impacto Ambiental Hombre" do
		    ImpactoAmbientalHombre(@hombre)
		end

		it "Impacto Ambiental Mujer" do
		    ImpactoAmbientalMujer(@mujer)
		end
	end
	
	describe "Nodo" do
		it "Debe existir un nodo de la lista con sus datos y su siguiente" do
			expect(@nodo_lentejas.next).to eq nil
			expect(@nodo_lentejas.prev).not_to eq nil
		end
	end
		
	describe "List" do

		it "Debe existir una lista con su cabecera" do
			expect(@lista_prueba2.head).not_to eq nil
			
		end

		it "Debe existir una lista con su cola" do

			expect(@lista_prueba2.tail).not_to eq nil
		end

		 
		it "Se puede insertar un elememto por la cabecera" do
			expect(@lista_prueba.get_size).to eq(0)
			@lista_prueba.insert_head(@lentejas)
			expect(@lista_prueba.get_size).to eq(1)
		end

		it "Se puede insertar un elemento por la cola" do
			expect(@lista_prueba.get_size).to eq(0)
			@lista_prueba.insert_tail(@chocolate)
			expect(@lista_prueba.get_size).to eq(1)
		end

		it "Se pueden insertar varios elementos" do
			@lista_prueba.insert_head(@lentejas)
			@lista_prueba.insert_head(@chocolate)
			expect(@lista_prueba.get_size).to eq(2)
		end
		 
		it "Se puede extraer el primer elemento de la lista" do
			expect(@lista_prueba2.size).to eq(2)
			@aux = @lista_prueba2.extract_head
			expect(@lista_prueba2.size).to eq(1)
			
		end
			
		it "Se debe extraer el último elemento de la lista" do
			@lista_prueba2.insert_head(@chocolate)
			expect(@lista_prueba2.size).to eq(3)
			@aux = @lista_prueba2.extract_tail
			expect(@lista_prueba2.size).to eq(2)
		end

		it "Expectativas para estimar las emisiones diarias de Gases de Efecto Invernadero para cada dieta" do
			expect(gasesefectoinvernadero(@dieta_española)).to eq(49.0)

			expect(gasesefectoinvernadero(@dieta_vasca)).to eq(53.44)

			expect(gasesefectoinvernadero(@dieta_vegetariana)).to eq(4.6)

		end

		it "Expectativas para estimar las emisiones anuales de Gases de Efecto Invernadero para cada dieta" do
			expect(gasesefectoinvernadero(@dieta_española)*256).to eq(12544.0)

			expect(gasesefectoinvernadero(@dieta_vasca)*256).to eq(13680.64)

			expect(gasesefectoinvernadero(@dieta_vegetariana)*256).to eq(1177.6)
                end
		
		it "Crear expectativas para estimar los metros cuadrados de uso de terreno para cada dieta" do
			expect(usodeterreno(@dieta_española)).to eq(228.0)

			expect(usodeterreno(@dieta_vasca)).to eq(173.12)

			expect(usodeterreno(@dieta_vegetariana)).to eq(13.5)
		end


	end

	describe "Comparable [Alimento]" do
	
		it "Pollo >= Nuez ? FALSE (valorEnergetico)" do
			expect(@pollo >= @nuez).to eq(false)
		end

		it "Pollo > Nuez ? FALSE (valorEnergetico)" do
			expect(@pollo > @nuez).to eq(false)
                end

		it "Pollo <= Nuez ? TRUE (valorEnergetico)" do
			expect(@pollo <= @nuez).to eq(true)
                end

                it "Pollo < Nuez ? TRUE (valorEnergetico)" do
			expect(@pollo < @nuez).to eq(true)
                end

		it "Pollo == Nuez ? FALSE (valorEnergetico)" do
			expect(@pollo == @nuez).to eq(false)
                end

	end
	
	describe "Enumerable [Alimento]" do

		it "Método max" do
			@lista_prueba.insert_head(@nuez)
			@lista_prueba.insert_head(@carnecordero)
			expect(@lista_prueba.max {|a,b| a <=> b}).to eq(@nuez)
		end

		it "Método min" do
			@lista_prueba.insert_head(@nuez)
                        @lista_prueba.insert_head(@carnecordero)
			expect(@lista_prueba.min {|a,b| a <=> b }).to eq(@carnecordero)
		end	

		it "Método sort" do
			@lista_prueba.insert_head(@nuez)
			@lista_prueba.insert_head(@carnecordero)
			expect(@lista_prueba.sort {|a,b| a <=> b}).to eq([@carnecordero,@nuez])
		end

		it "Método collect" do
                        @lista_prueba.insert_head(@carnecordero)
		        expect(@lista_prueba.collect {|i| i}).to eq([@carnecordero])
                end
		
		it "Método select" do
			@lista_prueba.insert_head(@carnecordero)
                        expect(@lista_prueba.select {|i| i}).to eq([@carnecordero])
		end
	end

	describe "Plato" do
		it "Obteniendo el nombre de un plato" do
			@plato.NombrePlato
		end
		
		it "Existe un conjunto de alimentos" do
			@lista = @plato.ListaAlimentos
			@aux = @lista.extract_head
			expect(@aux).to eq(@queso)
		end
		
		it "Existe un conjunto de cantidades de alimentos en gramos" do
                        @lista2 = @plato.ListaGramos
                        @aux = @lista2.extract_head
                        expect(@aux).to eq(60)

		end
		
		it "Porcentaje de proteinas del conjunto alimentos" do
			puts "Porcentaje de proteinas de mi plato: #{@plato.Porcentaje_Proteinas}%"
		end

		it "Porcentaje de lipidos del conjunto alimentos" do
                        puts "Porcentaje de lipidos de mi plato: #{@plato.Porcentaje_Lipidos}%"
                end

		it "Porcentaje de carbohidratos del conjunto alimentos" do
			puts "Porcentaje de carbohidratos de mi plato: #{@plato.Porcentaje_Carbohidratos}%"
		end

		it "Valor Calorico Total del conjunto de alimentos de mi plato expresado en kilocalorias" do 
			puts "Valor Calorico Total de mi plato: #{@plato.valorCaloricoTotal}kcal"
		end

		it "Se obtiene el plato formateado" do
			@plato.to_s
		end

	end

	describe "Platohijo" do
		it "Valor total de la emisiones diarias de gases de efecto invernadero" do
			puts "Valor total de las emisiones diarias de gases #{@plato2.emisionesGases}"
		end
		
		it "Estimacion de los metros cuadrados de uso de terreno" do
			puts "Estimación de los metros cuadrados de uso de terreno #{@plato2.metrosCuadradosTerreno}m²"
		end
		
		it "Se Obtiene la eficiencia energética	formateada" do
			puts "Eficiencia Energetica #{@plato2.to_s}"
	
		end

		it "Comprobar la clase de un objeto" do
			expect(@plato2.class).to eq(Platohijo)
		end

		it "Comprobar el tipo de un objeto" do
			expect(@plato2.kind_of?Object).to eq(true)
		end

		it "Comprobar jerarquía del objeto" do
			expect(@plato2.is_a?Plato).to eq(true)
		end
	end

	describe "Comparable [Plato]" do
		it "Valor Calorico Total Plato Español < Valor Calorico Total Plato Vasco ? FALSE (valorEnergetico)" do
                        expect(@plato_español < @plato_vasco).to eq(false)
                end

		it "Valor Calorico Total Plato Español > Valor Calorico Total Plato Vasco ? TRUE (valorEnergetico)" do
                        expect(@plato_español > @plato_vasco).to eq(true)
                end

		it "Valor Calorico Total Plato Español <= Valor Calorico Total Plato Vasco ? FALSE (valorEnergetico)" do
                        expect(@plato_español <= @plato_vasco).to eq(false)
                end

		it "Valor Calorico Total Plato Español >= Valor Calorico Total Plato Vasco ? TRUE (valorEnergetico)" do
                        expect(@plato_español >= @plato_vasco).to eq(true)
                end

		it "Valor Calorico Total Plato Español == Valor Calorico Total Plato Vasco ? FALSE (valorEnergetico)" do
                        expect(@plato_español == @plato_vasco).to eq(false)
                end
	end

	describe "Comparable [Platohijo]" do
		it "Valor Impacto Ambiental Plato Español < Valor Impacto Ambiental Plato Vasco ? FALSE (valorEnergetico)" do
			expect(@platohijo_español < @platohijo_vasco).to eq(false)
                end

                it "Valor Impacto Ambiental Plato Español > Valor Impacto Ambiental Plato Vasco ? TRUE (valorEnergetico)" do
			expect(@platohijo_español > @platohijo_vasco).to eq(true)
                end

                it "Valor Impacto Ambiental Plato Español <= Valor Impacto Ambiental Plato Vasco ? FALSE (valorEnergetico)" do
			expect(@platohijo_español <= @platohijo_vasco).to eq(false)
                end

                it "Valor Impacto Ambiental Plato Español >= Valor Impacto Ambiental Plato Vasco ? TRUE (valorEnergetico)" do
			expect(@platohijo_español >= @platohijo_vasco).to eq(true)
                end

               	it "Valor Impacto Ambiental Plato Español == Valor Impacto Ambiental Plato Vasco ? FALSE (valorEnergetico)" do
			expect(@platohijo_español == @platohijo_vasco).to eq(false)
                end
	end

	describe "Enumerable [Alimento]" do

                it "Método max" do
                        @lista_platos.insert_head(@plato_español)
                        @lista_platos.insert_head(@plato_vasco)
                        expect(@lista_platos.max {|a,b| a <=> b}).to eq(@plato_español)
                end

                it "Método min" do
                        @lista_platos.insert_head(@plato_vegetaria)
                        @lista_platos.insert_head(@plato_vegetariana)
                        expect(@lista_platos.min {|a,b| a <=> b}).to eq(@plato_vegetaria)
                end

                it "Método sort" do
                        @lista_platos.insert_head(@plato_carne)
                        @lista_platos.insert_head(@plato_vasco)
                        expect(@lista_platos.sort {|a,b| a <=> b}).to eq([@plato_vasco, @plato_carne])
                end

                it "Método collect" do
                        @lista_platos.insert_head(@plato_vegetaria)
                        expect(@lista_platos.collect {|i| i}).to eq([@plato_vegetaria])
                end

                it "Método select" do
                        @lista_platos.insert_head(@plato_español)
                        expect(@lista_platos.select {|i| i}).to eq([@plato_español])
                end
        end

	describe "Menú dietetico" do

		context "Pruebas usando paradigmas de programación funcional" do
			it "Huella nutricional máxima del menú" do
				expect(@MenuDietetico.collect{|x| x.HuellaNutricional}.max).to eq(1.0)
			end
			
			it "Incrementar precios de los platos" do
	                  @huellanutricionalMax = @MenuDietetico.collect{|x| x.HuellaNutricional}.max
			  @porcentaje = 0.0
			  if @huellanutricionalMax < 2
				  @porcentaje = 0.10
			  elsif @huellanutricionalMax >= 5
				  @porcentaje = 0.30
			  else 
				  @porcentaje = 0.20
		 	  end
			  @preciosModificados = @MenuPrecios.collect{|x| x +=x*@porcentaje}
			end
		end
	end
end
