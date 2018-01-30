<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Bar Order Summary</h3>
				<div class="panel-options">
				<select id="range1" class="form-control input-sm">
		        <option value="all" selected="selected"><a href="all">All Order</a></option>
		        <option value="delivery"><a href="delivery">Delivery</a></option>
		        <option value="pickup"><a href="pickup">Pickup</a></option>
		        <option value="dinein"><a href="dinein">Dine-in</a></option>
		        <option value="pos"><a href="pos">Point-of-sales</a></option>
				</select>
				</div>
			</div> 
			<!-- new bar chart.js -->
			<div id="container" style="width: 100%;">
        		<canvas id="canvas"></canvas>
			</div>
			<script type="text/javascript">
				var barallorderdata = 
				{
		            datasets: [{
			            label: 'Sales',
			            yAxisID: 'bo-1',
			            backgroundColor: 'rgba(153, 102, 255, 1)',
			            data: [
				        	<?php foreach($report['barallorder'] as $v) { ?>
				    			"<?php echo $v['quantity'];?>",
				    		<?php } ?>
			    		]
			    	}, {
			            label:'Amount',
			            yAxisID: 'bo-2',
			            backgroundColor: 'rgba(255, 159, 64, 1)',
			            data: [
				        	<?php foreach($report['barallorder'] as $v) { ?>
				    			"<?php echo $v['amount'];?>",
				    		<?php } ?>
			    		]
		        	}],
		        	labels: [
			        	<?php foreach($report['barallorder'] as $v) { ?>
				    			"<?php echo $v['state'];?>",
				    		<?php } ?>
			    	],
			    };
			</script>

		</div>
			
	</div>
</div>
<script type="text/javascript"><!--
  $('#range1').on('change', function(e) {
    e.preventDefault();
    console.log($('.input-sm').val());
    
    $(this).parent().parent().find('li').removeClass('active');
    
    $(this).parent().addClass('active');
    
    $.ajax({
      type: 'get',
      url: 'index.php?route=extension/dashboard/barallorder/barallorder&token=<?php echo $token; ?>&range1=' + $('#range1').val(),
      dataType: 'json',
      success: function(json) {
      	console.log(json);

      	var qty = [];
      	var label = [];
      	var amount = [];

      	json.report.forEach((value) => {
      		label.push(value.state);
      		qty.push(value.quantity);
      		amount.push(value.amount);
      	});

      	myBar.data.labels = label;
      	myBar.data.datasets[0].data = qty;
      	myBar.data.datasets[1].data = amount;
				myBar.update();

      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
     }
    });
  });
  $('#range1 .active a').trigger('click');
</script> 