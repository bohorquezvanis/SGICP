class Cotizacion < ActiveRecord::Base
	def self.search(search, page) where(['upper(id) like ?', 
		"%#{search}%".upcase]).paginate(page: page, per_page: 5).order("id") 
	end 
	# Validar que los atributos sean obligatorios
	validates :cliente, :presence => true
	validates :telefono, :presence => true
	validates :empresa, :presence => true
	validates :nit, :presence => true
	validates :producto, :presence => true
	validates :descripcion, :presence => true
	validates :cantidad, :presence => true
	validates :precio, :presence => true
	validates :iva, :presence => true
	validates :subtotal, :presence => true
	validates :total, :presence => true
	validates :estado, :presence => true
	# validar que un atributos unicos
	validates :telefono, uniqueness: { message: "No se puede Repetir" }
	# Valida si un atributo es numerico
	validates :telefono, numericality: true
	

end
