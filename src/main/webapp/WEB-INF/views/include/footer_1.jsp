<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
    </div>
    <!-- firebase -->
    <script src="https://www.gstatic.com/firebasejs/3.6.8/firebase.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- iCheck -->
    <script src="/resources/plugins/iCheck/icheck.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
    <script src="/resources/dist/js/main.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
    <!-- sweetalert -->
    <script src="/resources/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="/resources/plugins/select2/select2.full.min.js"></script>
    <!-- bootstrap datepicker -->
	<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Dual Listbox -->
    <script src="/resources/plugins/dualListbox/jquery.bootstrap-duallistbox.js"></script>
    <script>
	    $('#registerDate').datepicker({
	        autoclose: true,
	        format: 'yyyy-mm-dd'
	    });
	    
	    $('#projectDate').daterangepicker({
	    	timePicker: true,
	    	timePickerIncrement: 30,
	    	format: 'yyyy-mm-dd'
    	});

    	$('input[type="checkbox"].minimal').iCheck({
	        checkboxClass: 'icheckbox_minimal-blue',
	        radioClass: 'iradio_minimal-blue'
	    });
    	$(".select2").select2();
    </script>
  </body>
</html>