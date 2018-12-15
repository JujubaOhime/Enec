class Lot < ApplicationRecord
    mount_uploader :therm, TermUploader
    enum payment_status: {
        "Ativo": 1, 
        "Não Ativo": 2
    }
end
