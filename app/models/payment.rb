class Payment < ApplicationRecord
  belongs_to :package
  belongs_to :user
  has_many :parcels

  before_create :apply_rate_to_value

  enum payment_option: {"boleto": 1 , "cartao": 2}
  enum parceling_options: {"1x sem juros": 1 ,"2x sem juros": 2 ,"3x sem juros": 3 ,"4x sem juros": 4 ,"5x sem juros": 5 ,"6x com juros no cartão(somente no cartão)": 6 ,"7x com juros no cartão(somente no cartão)": 7 ,"8x com juros no cartão(somente no cartão)": 8 ,"9x com juros no cartão(somente no cartão)": 9 ,"10x com juros no cartão(somente no cartão)": 10}

  def generate_parcels(quantity)
    quantity = BigDecimal.new(quantity)

    parcel_general_value = value/quantity
    total_value = value
    while total_value > 0
      parcel = Parcel.create(
        value: parcel_general_value,
        payment: self,
        status: 0
        )
        total_value -= parcel_general_value
    end

    # Se na hora de dividir o valor das parcelas der um valor
    # negativo no valor do pagamento, quer dizer que as parcelas
    # estão cobrando, ao todo, um valor maior que o pagamento previsto.
    # Por isso, isso é checado e tratado fazendo a última parcela ter
    # valor um pouco menor, nesse tipo de caso.

    if total_value != 0
      parcel.update(value: parcel.value + total_value)
    end
  end

  private
    def apply_rate_to_value
      self.value = value * 1.05
    end
end
