module StaticPagesHelper
  def package_select
    @packages = Package.all.includes(:lot)
    
    @packages.all.collect { |p| ["#{p.lot.name}, #{p.name},
      #{number_to_currency(p.value, :unit => "R$ ", :separator => ",",
      :delimiter => ".")}", p.id] }
  end
end
