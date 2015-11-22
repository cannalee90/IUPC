$(document).ready(function() {
    $(".panel-body").collapse({ 'toggle': true });
    $("#checkAll").change(function () {
        $("input:checkbox").prop('checked', $(this).prop("checked"));
    });
    $("input").change(function () {
        var ret = $("input:checked").size();
        if($("#checkAll:checked").prop("checked"))
            ret = ret - 1;
        $("span#checkedReceiver").text(ret);
        
    });
    
});

