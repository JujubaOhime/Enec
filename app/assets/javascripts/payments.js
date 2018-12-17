$(document).ready(function(){
    parcels = $('.parcel-change-status');
    for(var i=0; i<parcels.length; i++)
        parcels[i].addEventListener('change', function(e){
            alert("oi");
            var id = e.target.id;
            alert(id);
            id = id.replace("parcel_", "");
            $.ajax({
                type:"POST",
                url:`/parcelas/${id}/update_status`,
                success:function(result){
                    alert("Status atualizado!");
                }
            });
        });
});