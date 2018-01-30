<div class="panel panel-default top-products c-widget c-widget-normal">
	<div class="panel-heading">
		<h3 class="panel-title"><?php echo $heading_title; ?></h3>
	</div>
	<div class="panel-body">
		<div class="short-description"><?php echo $text_top_products_description; ?></div>
		<div class="hidden text_view"><?php echo $text_view_2; ?></div>
		<div class="hidden text_sold"><?php echo $text_sold; ?></div>
		<div class="hidden text_no_data"><?php echo $text_no_data; ?></div>
		<div class="hidden text_error_chart"><?php echo $text_error_chart; ?></div>
		<div class="top-products-chart-container">
			<div class="top-products-details">
				<div class="range">
					<div class="range-label"><?php echo $entry_range; ?></div>
					<select id="range-top-products">
						<option value="day"><?php echo $text_day; ?></option>
						<option value="week"><?php echo $text_week; ?></option>
						<option value="month" selected="selected"><?php echo $text_month; ?></option>
						<option value="year"><?php echo $text_year; ?></option>
					</select>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="top-products-chart-outer">
				<div id="top-products-chart" class="graph-size-medium" data-graph-colors="<?php echo $colors_string; ?>"></div>
			</div>
			<div class="top-products-list">
				<ul class="clearfix">
					<?php
						for($i=0; $i < 5; $i++){ 
							?>
							<li class="top-products-<?php echo $i+1;?>">
								<div class="top-product-legend-color">
									<div class="legend-color-box" style="background-color: <?php echo $colors_array[$i]; ?>;"></div>
								</div>
								<div class="list-name">--</div>
							</li>
							<?php
						}
					?>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<script type="text/javascript"><!--

getTopCustomerProductChart('#top-products-chart', 'month', 'catalog/product/gettopproducts');

$('#range-top-products').on('change', function(){
	getTopCustomerProductChart('#top-products-chart', $(this).val(), 'catalog/product/gettopproducts');
});

//--></script>
<div class="clearfix"></div>