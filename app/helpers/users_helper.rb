module UsersHelper
    def user_lot_name(user)
        user_lot_id = user.lot_id
        lot = Lot.find(user_lot_id)
        return lot.name
    end
end
