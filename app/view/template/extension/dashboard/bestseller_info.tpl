<!-- Basic Setup -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Best Seller - All Store</h3>
				</div>
				<div class="panel-body">
					
					<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						$("#bestseller").dataTable({
							aLengthMenu: [
								[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
							]
						});
					});
					</script>
					
					<table id="bestseller" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
						<tbody id="form">
							<?php 
							$i = 1;
							foreach($report['bestseller'] as $v) { ?>
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