$(document).ready(function() {
    $(".panel-body").collapse({ 'toggle': true });
    $("#checkAll").change(function () {
        $("input:checkbox").prop('checked', $(this).prop("checked"));
    });
});

