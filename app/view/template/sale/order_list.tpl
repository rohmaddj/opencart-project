<?php echo $header; ?><?php echo $column_left; ?>
  <div class="page-header">
      <h1><?php echo $heading_title; ?></h1>
      <ol class="breadcrumb bc-3">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ol>
    </div>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
    <div class="col-md-8">

<ul class="nav nav-tabs nav-tabs-justified" id="accordion-sale">
  <li value="pending">
    <a href="index.php?route=sale/order/indexPending&token=<?php echo $token; ?>"  style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="hidden-xs">Pending</span>
    </a>
  </li>
  <li value="complete">
    <a href="index.php?route=sale/order/indexComplete&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="hidden-xs">Complete</span>
    </a>
  </li>
  <li value="processing">
    <a href="index.php?route=sale/order/indexProcessing&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="hidden-xs">Processing</span>
    </a>
  </li>
  <li value="intransit">
    <a href="index.php?route=sale/order/indexIntransit&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="hidden-xs">In-Transit</span>
    </a>
  </li>
  <li value="delivered">
    <a href="index.php?route=sale/order/indexDelivered&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="visible-xs"><i class="fa-bell-o"></i></span>
      <span class="hidden-xs">Delivered</span>
    </a>
  </li>
  <li value="canceled">
    <a href="index.php?route=sale/order/indexCanceled&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="visible-xs"><i class="fa-bell-o"></i></span>
      <span class="hidden-xs">Canceled</span>
    </a>
  </li>
  <li class="active">
    <a href="index.php?route=sale/order&token=<?php echo $token; ?>" style="margin: 0px;padding: 10px 5px 10px 5px">
      <span class="visible-xs"><i class="fa-bell-o"></i></span>
      <span class="hidden-xs">All</span>
    </a>
  </li>
</ul>
</div>

<div class="panel-group" id="accordion-test-2">
  <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapsefilter" class="btn btn-blue btn-icon" style="border-radius: 5px "> 
    <i class="fa-filter"></i> 
    <span>Filter</span>
  </a>
  <div class="col-md-12">
    <div id="collapsefilter" class="panel-collapse collapse in" style="background: #FFF">
      <div class="panel-body">
        
        <div class="col-sm-10">
        <label class="radio-inline"> <input type="radio" name="filter_last_order" checked>Today</label>
        <label class="radio-inline"> <input type="radio" name="filter_last_order" value="NOW() - INTERVAL 7 DAY">Last 7 Days</label>
        <label class="radio-inline"> <input type="radio" name="filter_last_order" value="NOW() - INTERVAL 30 DAY">Last 30 Days</label>
        <label class="radio-inline"> <input type="radio" name="filter_last_order">This Month</label>
        <label class="radio-inline"> <input type="radio" name="filter_last_order">Last Month</label>
        </div><div class="col-sm-12" style="opacity: 0">.</div>
        <div class="col-sm-3">
        <label class="radio-inline"> <input type="radio" name="radio2">Delivery Date From</label>
        </div>

        <div class="col-sm-3">
          <input type="text" name="filter_d_start" class="form-control datepicker" data-format="yyyy-mm-dd"/>
        </div>
        <div class="col-sm-3">
          <input type="text" name="filter_d_end" class="form-control datepicker" data-format="yyyy-mm-dd"/>
        </div><div class="col-sm-12" style="opacity: 0">.</div>
      
        <div class="col-sm-3">
        <label class="radio-inline"> <input type="radio" name="radio2">Order Date From</label>
        </div>

        <div class="col-sm-3">
          <input type="text" name="filter_o_start" class="form-control datepicker" data-format="yyyy-mm-dd"/>
        </div>
        <div class="col-sm-3">
          <input type="text" name="filter_o_end" class="form-control datepicker" data-format="yyyy-mm-dd"/>
        </div><div class="col-sm-12" style="opacity: 0">.</div>
        
        <div class="col-xs-3">
          <select id="range1" class="form-control input-sm">
            <option value="all" selected="selected"><a href="all">All Store</a></option>
            <option value="delivery"><a href="delivery">Official Store</a></option>
        </select>
        </div>

        <div class="col-xs-3">
          <select name="filter_order_status" class="form-control input-sm">
            <option value="1" selected="selected"><a href="all">All Order</a></option>
            <option value="3"><a href="delivery">Delivery</a></option>
            <option value="4"><a href="pickup">Pickup</a></option>
            <option value="5"><a href="dinein">Dine-in</a></option>
            <option value="6"><a href="pos">Point-of-sales</a></option>
        </select>
        </div>

        <div class="col-xs-3">
          <select id="range1" class="form-control input-sm">
            <option value="all" selected="selected"><a href="all">Paid & Unpaid</a></option>
            <option value="delivery"><a href="delivery">Delivery</a></option>
            <option value="pickup"><a href="pickup">Pickup</a></option>
            <option value="dinein"><a href="dinein">Dine-in</a></option>
            <option value="pos"><a href="pos">Point-of-sales</a></option>
        </select>
        </div><div class="col-md-12" style="text-align: right;">
          <a href="index.php?route=sale/order&token=<?php echo $token; ?>"> 
            <button class="btn btn-red btn-icon" style="border-radius: 5px"> 
              <i class="fa-eraser"></i>
              <span>Clear</span>
            </button>
          </a>
        </div>
        
        <div class="col-xs-2">By Customer </div>
        <div class="col-md-6"><input type="text" name="filter_customer" placeholder="type name, phone or email, order number" class="form-control"></div>
        
        <div class="col-md-4" style="text-align: right;">
            <button class="btn btn-blue btn-icon" style="border-radius: 5px" id="button-filter"> 
              <i class="fa-filter"></i>
              <span>Filter Now</span>
            </button>
        </div>
      
      </div>
    </div>
  </div>
<button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></button>
<button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></button>
<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-secondary"><i class="fa fa-plus"></i></a>
<button type="button" id="button-delete" form="form-order" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
<button class="btn btn-icon btn-blue"> <i class="fa-edit"></i> </button>
</div>
</div>

<div class="tab-content">
  <div class="tab-pane active" id="all">
    
    <div class="panel panel-default">

    <div class="panel-body">
      
    <script type="text/javascript">
      jQuery(document).ready(function($)
      {
        $.fn.dataTable.ext.errMode = 'none';
        $("#order-list-all").dataTable({
          order: [[1, 'asc']],
          columnDefs: [
            {targets: 'disable', orderable: false}],
          aLengthMenu: [
            [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
          ]
        });
      });
      </script>
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
      <table id="order-list-all" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="disable"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
            <th>No</th>
            <th>Order Date</th>
            <th>Delivery/Pickup Date</th>
            <th>Customer</th>
            <th>Status</th>
            <th class="disable">Payment</th>
            <th class="disable">Amount</th>
            <th>Store</th>
            <th class="disable">Action</th>
          </tr>
        </thead>
        <tbody>
        <?php if ($orders) { ?>
        <?php foreach ($orders as $order) { ?>
        <tr>
          <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
            <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
            <?php } ?>
            <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
          <td class="text-right"><?php echo $order['order_id']; ?></td>
          <td class="text-left"><?php echo $order['date_added']; ?></td>
          <td class="text-left"><?php echo $order['date_modified']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-left"><?php echo $order['order_status']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-right"><?php echo $order['total']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
        </tbody>
      </table>
      </form>
      
    </div>
    </div>
    </div>

<!--   <div class="tab-pane" id="tabs-pending">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <script type="text/javascript">
      jQuery(document).ready(function($)
      {
        $("#order-list-pending").dataTable({
          order: [[1, 'asc']],
          columnDefs: [
            {targets: 'disable', orderable: false}],
          aLengthMenu: [
            [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
          ]
        });
      });
      </script>
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
      <table id="order-list-pending" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="disable"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
            <th>No</th>
            <th>Order Date</th>
            <th>Delivery/Pickup Date</th>
            <th>Customer</th>
            <th>Status</th>
            <th class="disable">Payment</th>
            <th class="disable">Amount</th>
            <th>Store</th>
            <th class="disable">Action</th>
          </tr>
        </thead>
        <tbody>
        <?php if ($orders) { ?>
        <?php foreach ($orders as $order) { ?>
        <tr>
          <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
            <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
            <?php } ?>
            <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
          <td class="text-right"><?php echo $order['order_id']; ?></td>
          <td class="text-left"><?php echo $order['date_added']; ?></td>
          <td class="text-left"><?php echo $order['date_modified']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-left"><?php echo $order['order_status']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-right"><?php echo $order['total']; ?></td>
          <td class="text-left"><?php echo $order['customer']; ?></td>
          <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
        </tbody>
      </table>
      </form>
      
    </div>
    </div>
  </div> -->

    <!-- <div class="tab-pane" id="tabs-complete">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>">No</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>">No</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Order Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Order Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>">Delivery/Pickup Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>">Delivery/Pickup Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left">Payment</td>
                  <td class="text-right">Amount</td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
                  <td class="text-right"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-left"><?php echo $order['order_status']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      
    </div>
    </div>
  </div>

    <div class="tab-pane" id="tabs-processing">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>">No</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>">No</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Order Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Order Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>">Delivery/Pickup Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>">Delivery/Pickup Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left">Payment</td>
                  <td class="text-right">Amount</td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
                  <td class="text-right"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-left"><?php echo $order['order_status']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      
    </div>
    </div>
  </div>

    <div class="tab-pane" id="tabs-intransit">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>">No</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>">No</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Order Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Order Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>">Delivery/Pickup Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>">Delivery/Pickup Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left">Payment</td>
                  <td class="text-right">Amount</td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
                  <td class="text-right"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-left"><?php echo $order['order_status']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      
    </div>
    </div>
  </div>

    <div class="tab-pane" id="tabs-delivered">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>">No</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>">No</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Order Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Order Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>">Delivery/Pickup Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>">Delivery/Pickup Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left">Payment</td>
                  <td class="text-right">Amount</td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
                  <td class="text-right"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-left"><?php echo $order['order_status']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      
    </div>
    </div>
  </div>

    <div class="tab-pane" id="tabs-canceled">
      <div class="panel panel-default">

    <div class="panel-body">
      
      <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'o.order_id') { ?>
                    <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>">No</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_order; ?>">No</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Order Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Order Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>">Delivery/Pickup Date</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>">Delivery/Pickup Date</a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'order_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left">Payment</td>
                  <td class="text-right">Amount</td>
                  <td class="text-left"><?php if ($sort == 'customer') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                    <?php } ?>
                    <input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
                  <td class="text-right"><?php echo $order['order_id']; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['date_modified']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-left"><?php echo $order['order_status']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><?php echo $order['total']; ?></td>
                  <td class="text-left"><?php echo $order['customer']; ?></td>
                  <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      
    </div>
    </div>
  </div>
  </div> -->

<!--   <script type="text/javascript">
    function orderStatusAction(type) {
    
      $(this).parent().parent().find('li').removeClass('active');
      $(this).parent().addClass('active');
    
      $.ajax({
        type: 'get',
        url: 'index.php?route=sale/order/accordion&token=<?php echo $token; ?>&accordion-sale=' + type,
        dataType: 'json',
        success: function(json) {
          console.log(json);

          var row = '<tbody id="torder">';
          var dt = '';

          if (json.length == 0 ) {

            $("#torder").replaceWith(row + '<tr><td class="text-center" colspan="10"><?php echo $text_no_results; ?></td></tr></tbody>');
          
          } else {
            //triger for table
            json.orders.forEach((value) => {
              
              dt = dt + '<tr><td class="text-center"><?php if (in_array($order['order_id'], $selected)) { ?><input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" /><?php } else { ?><input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" /><?php } ?><input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td><td class="text-right">' + value.order_id + '</td><td class="text-left">' + value.date_order +'</td><td class="text-left">' + value.dpdate +'</td><td class="text-left">' + value.customer + '</td><td class="text-left">' + value.status + '</td><td class="text-left">' + value.customer + '</td><td class="text-right">' + value.amount + '</td><td class="text-left">' + value.customer + '</td><td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td></tr>';
             });
            $("#torder").replaceWith(row + dt + '</tbody>');
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }

    });
  };
  </script> -->

  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=sale/order&token=<?php echo $token; ?>';

	var filter_order_id = $('input[name=\'filter_order_id\']').val();

	if (filter_order_id) {
		url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
	}

  // var filter_last_order = $('input[name=\'filter_last_order\']:checked').val();

  // if(filter_last_order) {
  //   url += '&filter_last_order=' + encodeURIComponent(filter_last_order);
  // }

	var filter_customer = $('input[name=\'filter_customer\']').val();

	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}

	var filter_order_status = $('select[name=\'filter_order_status\']').val();

	if (filter_order_status != '*') {
		url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
	}

	var filter_total = $('input[name=\'filter_total\']').val();

	if (filter_total) {
		url += '&filter_total=' + encodeURIComponent(filter_total);
	}

	var filter_date_added = $('input[name=\'filter_date_added\']').val();

	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

	if (filter_date_modified) {
		url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
	}

  //filter for delivery data from
  var filter_d_start = $('input[name=\'filter_d_start\']').val();

  if (filter_d_start) {
    url += '&filter_d_start=' + encodeURIComponent(filter_d_start);
  }

  var filter_d_end = $('input[name=\'filter_d_end\']').val();

  if (filter_d_end) {
    url += '&filter_d_end=' + encodeURIComponent(filter_d_end);
  }

  //filter for order date from
  var filter_o_start = $('input[name=\'filter_o_start\']').val();

  if (filter_o_start) {
    url += '&filter_o_start=' + encodeURIComponent(filter_o_start);
  }

  var filter_o_end = $('input[name=\'filter_o_end\']').val();

  if (filter_o_end) {
    url += '$filter_o_end=' + encodeURIComponent(filter_o_end);
  }

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter_customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_customer\']').val(item['label']);
	}
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name^=\'selected\']').on('change', function() {
	$('#button-shipping, #button-invoice').prop('disabled', true);

	var selected = $('input[name^=\'selected\']:checked');

	if (selected.length) {
		$('#button-invoice').prop('disabled', false);
	}

	for (i = 0; i < selected.length; i++) {
		if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
			$('#button-shipping').prop('disabled', false);

			break;
		}
	}
});

$('#button-shipping, #button-invoice').prop('disabled', true);

$('input[name^=\'selected\']:first').trigger('change');

// IE and Edge fix!
$('#button-shipping, #button-invoice').on('click', function(e) {
	$('#form-order').attr('action', this.getAttribute('formAction'));
});

$('#button-delete').on('click', function(e) {
	$('#form-order').attr('action', this.getAttribute('formAction'));
	
	if (confirm('<?php echo $text_confirm; ?>')) {
		$('#form-order').submit();
	} else {
		return false;
	}
});
//--></script> 
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?> 