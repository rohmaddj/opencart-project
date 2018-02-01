<!-- Basic Setup -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Sale Contribution - All Store</h3>
				</div>
				<div class="panel-body">
					
					<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						$("#sale-contribution").dataTable({
							aLengthMenu: [
								[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
							]
						});
					});
					</script>
					
					<table id="sale-contribution" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>No</th>
								<th>Item by qty</th>
								<th>Delivery</th>
								<th>Pickup</th>
								<th>Dine-in</th>
								<th>Point of sales</th>
							</tr>
						</thead>					
						<tbody>
							<?php 
							$i = 1;
							foreach($report as $v) { ?>
							<tr>
								<td style="text-align: center;"><?php echo $i++;?></td>
								<td><?php echo $v['name'];?></td>
								<td><?php echo $v['name'];?></td>
								<td><?php echo $v['name'];?></td>
								<td><?php echo $v['name'];?></td>
								<td><?php echo $v['name'];?></td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
					
				</div>
			</div>
<script type="text/javascript">
	window.onload = function() {
		// bar all order
	    var ctx = document.getElementById("canvas").getContext("2d");
	    window.myBar = new Chart(ctx, {
	        type: 'bar',
	        data: barallorderdata,
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: false,
	                text: 'Bar Chart'
	            },
	            scales: {
		        yAxes: [{
		        	position: 'left',
		        	id: 'bo-1',
		            ticks: {
		                max: 50,
		                min: 0,
		                stepSize: 10
		            }
		        }, {
		        	position: 'right',
		        	id: 'bo-2',
		        	ticks: {
		        		max: 5000,
		        		min: 0,
		        		stepSize: 1000
		        	}
		        }]
		    	}

	        }
	    });

	    // bar all store
	    var ctx1 = document.getElementById("canvas1").getContext("2d");
	    window.myBar1 = new Chart(ctx1, {
	        type: 'bar',
	        data: allstoredata,
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: false,
	                text: 'Bar Chart'
	            },
	            scales: {
		        yAxes: [{
		        	position: 'left',
		        	id: 'bs-1',
		            ticks: {
		                max: 50,
		                min: 0,
		                stepSize: 10
		            }
		        }, {
		        	position: 'right',
		        	id: 'bs-2',
		        	ticks: {
		        		max: 5000,
		        		min: 0,
		        		stepSize: 1000
		        	}
		        }]
		    	}
	        },
	    });
	    // // bar today
	    // var ctx2 = document.getElementById("canvas2").getContext("2d");
	    // window.myBar2 = new Chart(ctx2, {
	    //     type: 'bar',
	    //     data: bartoday,
	    //     options: {
	    //         responsive: true,
	    //         legend: {
	    //             position: 'top',
	    //         },
	    //         title: {
	    //             display: false,
	    //             text: 'Bar Chart'
	    //         },
	    //         scales: {
		   //      yAxes: [{
		   //      	position: 'left',
		   //      	id: 'bt-1',
		   //          ticks: {
		   //              max: 50,
		   //              min: 0,
		   //              stepSize: 10
		   //          }
		   //      }, {
		   //      	position: 'right',
		   //      	id: 'bt-2',
		   //      	ticks: {
		   //      		max: 5000,
		   //      		min: 0,
		   //      		stepSize: 1000
		   //      	}
		   //      }]
		   //  	}
	    //     }
	    // });
	    // pie order type
	    var ctx3 = document.getElementById("ordertype").getContext("2d");
        window.myPie = new Chart(ctx3, ordertype);

        // pie receipt breakdown
	    var ctx4 = document.getElementById("receiptbreakdown").getContext("2d");
        window.myPie = new Chart(ctx4, receiptbreakdown);

        // pie payment mode
	    var ctx5 = document.getElementById("paymentmode").getContext("2d");
        window.myPie = new Chart(ctx5, paymentmode);
	};
</script>