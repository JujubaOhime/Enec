class Payment < ApplicationRecord
  belongs_to :package
  belongs_to :user
  enum payment_option: {"Boleto": 1 , "Cartão de crédito": 2}
  enum parceling_options: {"1x sem juros": 1 ,"2x sem juros": 2 ,"3x sem juros": 3 ,"4x sem juros": 4 ,"5x sem juros": 5 ,"6x com juros no cartão(somente no cartão)": 6 ,"7x com juros no cartão(somente no cartão)": 7 ,"8x com juros no cartão(somente no cartão)": 8 ,"9x com juros no cartão(somente no cartão)": 9 ,"10x com juros no cartão(somente no cartão)": 10}
end
