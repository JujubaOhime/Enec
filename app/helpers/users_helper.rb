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
    
    def user_package(user)
        user_package_id = user.package_id
        package = Package.find(user_package_id)
        return package
    end

    def user_package_possibilities(user)
        user_lot_id = user.lot_id
        lot = Lot.find(user_lot_id)
        package_possibilities = Package.where(lot_id: user_lot_id)
        return package_possibilities
    end

    def find_user_lot_by_id(id)
        user = User.find(id)
        user_lot = Lot.find(user.lot_id)
        return user_lot
    end

    def user_payment_exists?(user)
        if !Payment.first
            return false
        else
            if find_user_payment(user)
                return true
            end
        end
    end

    def user_ies(user)
        user_ies_id = user.IES_id
        ies = Ies.find(user_ies_id)
        return ies
    end
    
    def find_user_payment(user)
        payment = find_by(user_id: user.id)
        return payment
    end
end
