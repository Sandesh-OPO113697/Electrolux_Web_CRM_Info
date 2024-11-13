$(document).ready(function(){
  // Multiselect Dropdown Initialize JS code
  $('.multiselect').multiselect({
    includeSelectAllOption: true,
    enableFiltering: true,
  });

  // Desktop On Hover Sidebar JS Code
  $("#sidebarMenu").mouseout(function () {
    $("#sidebarMenu").removeClass('sidebar-expanded');
    $(".mainlogoicon").removeClass("hide");
    $(".responsiveCloseIcon").addClass("hide");
    setTimeout(function(){
      if( !$("#sidebarMenu").hasClass('sidebar-expanded')){
        $('.leftNavigationDropdown').removeClass("show").prev('a').removeClass("show");
      }
    }, 100);
    $(".mobileLogo").addClass("hide");

  }).mouseover(function () {
    $("#sidebarMenu").removeClass('sidebar-expanded').addClass('sidebar-expanded');   
    $(".mainlogoicon").removeClass("hide");
    $(".responsiveCloseIcon").removeClass("hide");
    $(".mobileLogo").addClass("hide");
  });

  // Toggle Switch Show hide
  $("#switch-id").change(function () {
    if ($(this).is(":checked")) {
      $(".cardsDiv").show();
    } else {
      $(".cardsDiv").hide();
    }
  });

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

  // Date Time Range JS
  $('input[name="startdatetime"]').daterangepicker({
    timePicker: true,
    singleDatePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
      format: 'DD/MM/YYYY hh:mm A'
    }
  });

  $('input[name="enddatetime"]').daterangepicker({
    timePicker: true,
    singleDatePicker: true,
    startDate: moment().startOf('hour'),
    endDate: moment().startOf('hour').add(32, 'hour'),
    locale: {
      format: 'DD/MM/YYYY hh:mm A'
    }
  });

  // Mobile Hamburger Click JS Code
  $('button.hamBurgerMenu').click(function () {
    $("#sidebarMenu").removeClass('sidebar-expanded').addClass('sidebar-expanded');
    $(".responsiveCloseIcon").removeClass("hide");
  });

  $('.responsiveCloseIcon button').click(function () {
    $("#sidebarMenu").removeClass('sidebar-expanded');
    $(".responsiveCloseIcon").addClass("hide");
  });

  // Show hide data for Graph JS Code
  $('#graphTableViewDiv').click(function(){
    $('.tableBarDiv').removeClass("hide");
    $('.graphDiv').addClass("hide");
    $('.graphtable_viewlister li:first-child').removeClass("hide");
    $('.graphtable_viewlister li:last-child').addClass("hide");
  });

  $('#graphViewDiv').click(function(){
    $('.tableBarDiv').addClass("hide");
    $('.graphDiv').removeClass("hide");
    $('.graphtable_viewlister li:first-child').addClass("hide");
    $('.graphtable_viewlister li:last-child').removeClass("hide");
  });

  $('#pieTableViewDiv').click(function(){
    $('.tablePieDiv').removeClass("hide");
    $('.pieDiv').addClass("hide");
    $('.graphtable_viewlister_dilaer li:first-child').removeClass("hide");
    $('.graphtable_viewlister_dilaer li:last-child').addClass("hide");
  });

  $('#pieViewDiv').click(function(){
    $('.tablePieDiv').addClass("hide");
    $('.pieDiv').removeClass("hide");
    $('.graphtable_viewlister_dilaer li:first-child').addClass("hide");
    $('.graphtable_viewlister_dilaer li:last-child').removeClass("hide");
  });

  // Show Hide Active User Button JS Code
  $(".condtion_toggle .alluser").click(function(e){
    $(".condtion_toggle .alluser").addClass("hide");
    $(".condtion_toggle .activeuser").removeClass("hide");
  });
     
   $(".condtion_toggle .activeuser").click(function(e){
    $(".condtion_toggle .alluser").removeClass("hide");
    $(".condtion_toggle .activeuser").addClass("hide");
  });

  // Mobile View Top Header Icon Click JS Code
  $('span[data-bs-toggle="tooltip"]').each(function() {
    $(this).click(function() {
      $(this).tooltip('show');
    });
  });
});



$(document).ready(function(){
  // Dialer Info Datatable JS Code
  $('#tableBarDiv').DataTable({
    paging: false,
    bLengthChange: false,
    bFilter: false,
    bInfo: false,
    bAutoWidth: false,
    ordering: false
  });

  // Dialer Calls Datatable JS Code
  $('#tablePieDiv').DataTable({
    paging: false,
    bLengthChange: false,
    bFilter: false,
    bInfo: false,
    bAutoWidth: false,
    ordering: false
  });

  // User Listing JS Code
  $('#userListing').DataTable({
    fixedColumns: true,
    paging: true,
    bLengthChange: false,
    bFilter: false,
    scrollCollapse: true,
    scrollX: true,
    scrollY: 'auto',
    ordering: false
  });
  
  $('#example').DataTable({
    fixedColumns: true,
    paging: true,
    scrollCollapse: true,
    scrollX: true,
    scrollY: 'auto',
    layout: {
      topEnd: {
        search: {
          placeholder: 'Search'
        }
      },
    },
    columnDefs: [
      {
        orderable: false,
        render: DataTable.render.select(),
        targets: 0
      }
    ],
    select: {
      style: 'os',
      selector: 'td:first-child'
    },
    order: [[1, 'asc']]
  });

  $('#mapUser').DataTable({
    fixedColumns: false,
    paging: true,
    scrollCollapse: true,
    scrollX: true,
    scrollY: 'auto',
    ordering: false,
    bLengthChange: true,
    bFilter: true,
    layout: {
      topEnd: {
        search: {
          placeholder: 'Search'
        }
      },
    },
    columnDefs: [
      {
        orderable: false,
        render: DataTable.render.select(),
        targets: 0
      }
    ],
    select: {
      style: 'os',
      selector: 'td:first-child'
    },
    order: [[1, 'asc']]
  });
});