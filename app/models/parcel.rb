class Parcel < ApplicationRecord
  belongs_to :payment

  enum status: {"Pago": 1 , "Não Pago": 2, "Em Atraso": 3, "Não Emitida": 4}

end
