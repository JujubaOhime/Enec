module PaymentsHelper
    def user_package(user)
        user_package_id = user.package_id
        package = Package.find(user_package_id)
        return package
    end
end
