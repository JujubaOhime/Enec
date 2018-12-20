class Payment < ApplicationRecord
  belongs_to :package
  belongs_to :user
  has_many :parcels, dependent: :destroy

  validates :package_id, presence: true
  validates :payment_option, presence: true
  validates :parceling_option, presence: true

  before_create :calculate_value

  enum payment_option: {"boleto": 1 , "cartao": 2}
  enum parceling_options: {"1x sem juros": 1 ,"2x sem juros": 2 ,"3x sem juros": 3 ,"4x sem juros": 4 ,"5x sem juros": 5 ,"6x com juros no cartão(somente no cartão)": 6 ,"7x com juros no cartão(somente no cartão)": 7 ,"8x com juros no cartão(somente no cartão)": 8 ,"9x com juros no cartão(somente no cartão)": 9 ,"10x com juros no cartão(somente no cartão)": 10}

  def generate_parcels
    quantity = parceling_option_before_type_cast

    parcel_general_value = (value/quantity).round(2)
    total_value = value
    quantity.times do |i|
      @parcel = Parcel.create(
        value: parcel_general_value,
        payment: self,
        status: 4
        )
        total_value -= parcel_general_value
    end

    # Se na hora de dividir o valor das parcelas der um valor
    # negativo no valor do pagamento, quer dizer que as parcelas
    # estão cobrando, ao todo, um valor maior que o pagamento previsto.
    # Por isso, isso é checado e tratado fazendo a última parcela ter
    # valor um pouco menor, nesse tipo de caso.

    if total_value != 0
      @parcel.update(value: (@parcel.value + total_value).round(2))
    end
  end

  private
    def calculate_value
      if self.valid?
        quantity_parcels = parceling_option_before_type_cast.to_i
      
        if payment_option == 'boleto'
          self.value += quantity_parcels * BigDecimal.new("3.95")

        elsif payment_option == 'cartao'
          value_without_rate = value
          self.value += value * BigDecimal.new("0.0499") 
          self.value += quantity_parcels * BigDecimal.new("0.50")
          
          if quantity_parcels > 5
            parcel_value = (value_without_rate/quantity_parcels).round(2)
            self.value += ((parcel_value * (1 + BigDecimal.new("0.025")) ** (quantity_parcels-5)) - parcel_value) * (quantity_parcels-5)
          end
        end
      end
    end
end
