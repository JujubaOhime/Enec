module PaymentsHelper
    def user_package(user)
        user_package_id = user.package_id
        package = Package.find(user_package_id)
        return package
    end

# ************************************************
# * MÉTODOS FEITOS PARA PÁGINA DE NOVO PAGAMENTO *
# ************************************************
    # retorna os pacotes associados ao lote do usuario
    def package_select(user)
        @packages = Package.where(lot_id: user.lot_id).includes(:lot)
        
        @packages.all.collect { |p| ["#{p.lot.name}, #{p.name},
        #{number_to_currency(p.value, :unit => "R$ ", :separator => ",",
        :delimiter => ".")}", p.id] }
    end

    def parcelas(package_id, pagamento)
        package = Package.find(package_id)
        
        # todos os pagamentos contam com uma taxa base de 5%
        valor_com_taxa = package.value * 1.05
        
        valor_monetario_com_taxa = number_to_currency(valor_com_taxa, :unit => "R$ ", 
                                            :separator => ",",
                                            :delimiter => ".")
        
        parcelas_simples = [
            { parcelas: 1, detalhes: "1x de #{ valor_monetario_com_taxa }, total: #{ valor_monetario_com_taxa }" },
            { parcelas: 2, detalhes: "2x de #{ valor_monetario_parcelado(valor_com_taxa, 2) },
            total: #{ valor_monetario_com_taxa }" },
            { parcelas: 3, detalhes: "3x de #{ valor_monetario_parcelado(valor_com_taxa, 3) },
            total: #{ valor_monetario_com_taxa }" },
            { parcelas: 4, detalhes: "4x de #{ valor_monetario_parcelado(valor_com_taxa, 4) },
            total: #{ valor_monetario_com_taxa }" },
            { parcelas: 5, detalhes: "5x de #{ valor_monetario_parcelado(valor_com_taxa, 5) },
            total: #{ valor_monetario_com_taxa }" },
            ]
        
        if pagamento == "boleto"
        return parcelas_simples
        elsif pagamento == "cartao"
        # pagamentos no cartão com mais de 5 parcelas tem juros compostos de 3% sobre o valor do pacote
        
        parcelas_compostas = parcelas_simples
        
        parcelas_compostas.append({ parcelas: 6, detalhes: "6x de 
            #{ parcela_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 6), 6) },
            total: #{ total_monetario_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 6)) }" })
        
        parcelas_compostas.append({ parcelas: 7, detalhes: "7x de 
            #{ parcela_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 7), 7) },
            total: #{ total_monetario_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 7)) }" })
            
        parcelas_compostas.append({ parcelas: 8, detalhes: "8x de 
            #{ parcela_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 8), 8) },
            total: #{ total_monetario_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 8)) }" })
            
        parcelas_compostas.append({ parcelas: 9, detalhes: "9x de 
            #{ parcela_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 9), 9) },
            total: #{ total_monetario_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 9)) }" })
            
        parcelas_compostas.append({ parcelas: 10, detalhes: "10x de 
            #{ parcela_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 10), 10) },
            total: #{ total_monetario_com_juros_compostos(total_com_juros_compostos(valor_com_taxa, 10)) }" })
        
        return parcelas_compostas
        end
        [{parcelas: "", detalhes: "Selecione forma de pagamento"}]
    end

    def valor_monetario_parcelado(valor, parcelas)
        number_to_currency((valor / parcelas), :unit => "R$ ", 
                                            :separator => ",",
                                            :delimiter => ".")
    end

    def total_com_juros_compostos(capital_inicial, periodo)
        capital_inicial * (1 + 0.03) ** periodo
    end

    def total_monetario_com_juros_compostos(valor)
        number_to_currency(valor, 
                                :unit => "R$ ", 
                                :separator => ",",
                                :delimiter => ".")
    end

    def parcela_com_juros_compostos(valor, parcelas)
        number_to_currency((valor / parcelas), 
                                :unit => "R$ ", 
                                :separator => ",",
                                :delimiter => ".")
    end
end
