module PackagesHelper
    def lot_options
        Lot.all.collect {|x| [x.name, x.id]}
    end
end
