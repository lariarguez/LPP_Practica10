
Node = Struct.new(:value, :next, :prev)
# Clase que representa una Lista enlazada
class List

      # Incluimos el módulo Enumerable
	include Enumerable
	
	attr_reader :size, :head, :tail
	
	# Constructor de la clase list
	def initialize
		@size = 0
		@head = nil
		@tail = nil

	end
	# Método para insertar un nodo por la cabeza
	def insert_head(value)
		
		nodo = Node.new(value, nil, nil)
		
		if (@size == 0)
			@tail = nodo
			nodo.next = nil
		else
			@head.prev = nodo
			nodo.next = @head
		end

		@head = nodo
		nodo.prev = nil
		@size = @size + 1

	end

	# Método para insertar un nodo por la cola
	def insert_tail(value)
		
		nodo = Node.new(value, nil, nil)
		
		if (@size == 0)
			@head = nodo
			nodo.prev = nil
		else
			@tail.next = nodo
			nodo.prev = @tail
		end

		@tail = nodo
		nodo.next = nil
		@size = @size + 1
	end
	
	# Método para extraer un nodo por la cabeza
	def extract_head

		if (@size == 0)
			puts "La lista esta vacia"
		else
			aux = @head
			(@head.next).prev = nil
			@head = @head.next
			@size = @size - 1
			return aux.value
		end
	end

	# Método para extraer un nodo por la cola
	def extract_tail
		
		if (@size == 0)
			puts "La lista esta vacía"
		else
			aux = @tail
			(@tail.prev).next = nil
			@tail = @tail.prev
			@size = @size - 1
			return aux.value
		end
	end 

	# Método para obtener el tamaño de la lista
	def get_size
		@size
	end

	# Método para seleccionar un nodo de la lista
	def each
		return nil unless @size > 0
		aux = @head
		until aux.nil?
			yield aux.value
			aux = aux.next
		end
	end

	# Operador corchete para acceder a un nodo de la lista
	def [] (index)
		if index.is_a?Integer
			if index == 0
				return @head.value
			elsif index == (@size - 1)
				return @tail.value
			elsif index < (@size - 1) && index > 0
			      	iterator = @head
				index.times(iterator = iterator.next)
				return iterator.value
			else
				return nil
			end
		end
	end

	
end
