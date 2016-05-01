//= require active_admin/base
//= require tinymce

$(document).ready(function() {
  tinyMCE.init({
     mode : "specific_textareas",
     editor_selector : "tinymce_editor",
     plugins : ["link", "image"]
   });
   $("#collection_selection_toggle_all").change(function () {
       $("input:checkbox").prop('checked', $(this).prop("checked"));
   });
  //  $("input").change(function () {
  //      var ret = $("input:checked").size();
  //      if($("#checkAll:checked").prop("checked"))
  //          ret = ret - 1;
  //      $("span#checkedReceiver").text(ret);
   //
  //  });

});
