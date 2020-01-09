class MenuDSL

	attr_accessor :name, :desc, :componentes

  	def initialize(name,&block)
  
    		@name = name
    		@componentes = []

    		if block_given?  
     			if block.arity == 1
        			yield self
      			else
       				instance_eval(&block) 
      			end
    		end
  	end


  	def descripcion(texto)
    		@desc = texto
 	end 

  	def componente(args={})

   		temporal = []
    		temporal << "#{args[:descripcion] }" if args[:descripcion]
    		temporal << args[:plat]  if args[:plat]
    		temporal << "#{args[:precio]}" if args[:precio]

    		@componentes << temporal

  	end

  	def to_s
 
		cadena = ""
    		cadena += "#{name} - #{desc}\nComponentes:\n"

    		for i in @componentes
      			cadena += i[0]
      			cadena += " - "
      			cadena += i[2]
      			cadena += "€\n"
    		end

    		cadena += "Valores nutricionales y ambientales:\n "

    		for i in @componentes
      			cadena += i[1].p.to_s
      			cadena += " "
      			cadena += i[1].c.to_s
      			cadena += " "
      			cadena += i[1].l.to_s
    	  		cadena += " "
      			cadena += i[1].gei.to_s
      			cadena += " "
      			cadena += i[1].ter.to_s
      			cadena += "\n "
    		end
    
    		return cadena



  	end


end





