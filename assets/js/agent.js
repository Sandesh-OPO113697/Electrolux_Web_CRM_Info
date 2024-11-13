$(document).ready(function(){

 // Dark and Light theme mode JS code
  $("#darkcolorMode").click(function(){
    $("body").toggleClass("darkThemeColor");
  });


  // Common Search Close JS Code
  $('.commonSearh_wrapper').hide();

  $('.commonSearchShowHide').click(function(){
    $('.commonSearh_wrapper').show();
    $(".commonSearh_wrapper").addClass('openCustomCommonSearch');
  });
  $('#closeWrapper').click(function(){
    $('.commonSearh_wrapper').hide();
    $(".commonSearh_wrapper").removeClass('openCustomCommonSearch');
  });


/*Call Notes DataTable JS starts here*/
  $('#callnotes').DataTable({
  layout: {
  topEnd: {
            search: {
                placeholder: 'Search Issue'
            }
        },
  },
  
    
      columnDefs: [
          {
              orderable: false,
              // render: DataTable.render.select(),
              targets: 0
          }
      ],
      select: {
          style: 'os',
          selector: 'td:first-child'
      },
      order: [[1, 'asc']]
    });

/*Call Notes DataTable JS ends here*/


/*LiveDialer Btn Script Starts Here*/
  $('#liveDialerBtn,.close-toast').click(function(){

            $('.popcontent').toggle();
            $('.off-canvas-backdrop').toggle();

             $('#liveToast').toggle();

           });
  /*LiveDialer Btn Script Ends Here*/



/*DISPOSITION CALL OffCanvas js starts here*/
$('#minimizecanvas').click(function() {
    debugger;


    var canvasheight=$("#offcanvasBottom")

    var currentHeight  = canvasheight.height();

    if (currentHeight == 219) {
      canvasheight.height(60);
    } else {
      canvasheight.height(219);
    }
    
/*DISPOSITION CALL OffCanvas js Ends here*/
    
  

});


});