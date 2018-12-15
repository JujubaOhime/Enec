class Lot < ApplicationRecord
    mount_uploader :term, TermUploader
    enum payment_status: {
        "Ativo": 1, 
        "Não Ativo": 2
    }
end
