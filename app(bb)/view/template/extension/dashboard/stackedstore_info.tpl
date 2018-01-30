<div class="row">
	<div class="col-sm-12">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Today Order</h3>
			</div>
			<div id="container" style="width: 100%;">
        		<canvas id="canvas2"></canvas>
			</div>	
			<script type="text/javascript">
				var bartoday = 
				{
			            labels: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['state'];?>",
				    		<?php } ?>
				    	],
			            datasets: [{
			            label: 'Sales',
			            yAxisID: 'bt-1',
			            backgroundColor: 'rgba(153, 102, 255, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['quantity'];?>",
				    		<?php } ?>
				    	]
			        }, {
			            label:'Amount',
			            yAxisID: 'bt-2',
			            backgroundColor: 'rgba(255, 159, 64, 1)',
			            data: [
				        	<?php foreach($report as $v) { ?>
				    			"<?php echo $v['amount'];?>",
				    		<?php } ?>
				    	]
			        }]
			    };
			</script>
		</div>
	</div>
</div>