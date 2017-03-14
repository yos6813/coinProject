			<div class="footer">
	            <div class="pull-right">
	                10GB of <strong>250GB</strong> Free.
	            </div>
	            <div>
	                <strong>Copyright</strong> Example Company &copy; 2014-2017
	            </div>
	        </div>
	    </div>
	</div>
</div>
<!-- firebase -->
<script src="https://www.gstatic.com/firebasejs/3.6.8/firebase.js"></script>
    
<!-- Mainly scripts -->
<script src="resources/js/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="resources/js/plugins/flot/jquery.flot.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="resources/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="resources/js/inspinia.js"></script>
<script src="resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="resources/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="resources/js/demo/sparkline-demo.js"></script>

<!-- Toastr -->
<script src="resources/js/plugins/toastr/toastr.min.js"></script>
<script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugins/daterangepicker/moment.min.js"></script>
<script src="resources/js/plugins/daterangepicker/daterangepicker.js"></script>
<script src="resources/js/plugins/iCheck/icheck.min.js"></script>
<script src="resources/js/plugins/select2/select2.full.min.js"></script>

<!-- DevExtreme dependencies -->
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>

<!-- A DevExtreme library -->
<script type="text/javascript" src="https://cdn3.devexpress.com/jslib/15.1.11/js/dx.chartjs.js"></script>
<script type="text/javascript" src="https://cdn3.devexpress.com/jslib/15.1.11/js/dx.all.js"></script>
<script src="resources/js/plugins/dataTables/datatables.min.js"></script>
<script src="resources/js/main.js"></script>
<!-- Chosen -->
<script src="resources/js/plugins/chosen/chosen.jquery.js"></script>
<script>
$(document).ready(function () {
    $('.mine').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
});

$('#registerDate').datepicker({
    autoclose: true,
    format: 'yyyy.mm.dd'
});

$('#projectDate').daterangepicker({
 format: 'YYYY.MM.DD',
 timePicker: true,
	 timePickerIncrement: 30
});

$('input[type="checkbox"].minimal').iCheck({
   checkboxClass: 'icheckbox_minimal-blue',
   radioClass: 'iradio_minimal-blue'
});

$(".select2").select2();
</script>
<script>
$(document).ready(function(){
    $('.dataTables-example').DataTable({
        pageLength: 25,
        responsive: true,
        dom: '<"html5buttons"B>lTfgitp',
        buttons: [
            {extend: 'copy'},
            {extend: 'csv'},
            {extend: 'excel', title: 'ExampleFile'},
            {extend: 'pdf', title: 'ExampleFile'},

            {extend: 'print',
            	customize: function (win){
                    $(win.document.body).addClass('white-bg');
                    $(win.document.body).css('font-size', '10px');

                    $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
           		}
            }
        ]
    });
});
</script>
</body>
</html>