module UsersHelper
    def user_lot_name(user)
        user_lot_id = user.lot_id
        lot = Lot.find(user_lot_id)
        return lot.name
    end
    def user_lot(user)
        user_lot_id = user.lot_id
        lot = Lot.find(user_lot_id)
        return lot
    end
    def user_ies(user)
        user_ies_id = user.IES_id
        ies = Ies.find(user_ies_id)
        return ies
    end
end
