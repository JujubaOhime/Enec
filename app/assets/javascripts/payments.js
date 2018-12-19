$(document).ready(function(){
    parcels = $('.parcel-change-status');
    for(var i=0; i<parcels.length; i++)
        parcels[i].addEventListener('change', function(e){
            var id = e.target.id;
            var new_status = e.target.value;
            id = id.replace("parcel_", "");
            $.ajax({
                type:"POST",
                url:"/parcelas/update_status",
                dataType:"json",
  	            data: { id: id, new_status: new_status },
                success:function(result){
                    alert("Status atualizado!");
                }
            });
        });
});