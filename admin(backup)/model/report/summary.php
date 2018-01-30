<?php
class ModelReportSummary extends Model {

	public function getTotalOrder() {
		$sqltotal = "SELECT count(order_id) AS total FROM `" . DB_PREFIX . "order` GROUP BY DATE(date_added)";
		$querytotal = $this->db->query($sqltotal);

		$sql_amount = "SELECT SUM(total) AS total_amount FROM `" . DB_PREFIX . "order` GROUP BY DATE(date_added)";
		$query_amount = $this->db->query($sql_amount);

		return [$querytotal->rows[0]['total'], $query_amount->rows[0]['total_amount']];
	}

	public function getTotalSummarysByDay() {

		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) as totaldelivery FROM oc_order_history as ooh WHERE order_status_id = 3 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 2 AND DATE(ooh.date_added) = DATE(NOW())";
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		// query bar order
		$querybarallorder = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) = DATE(NOW()) GROUP BY DATE(oh.date_added)");

		//query bar store
		$querybarstore = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE DATE(oh.date_added) = DATE(NOW()) GROUP BY DATE(oh.date_added)");

		// query best seller
		$querybestseller = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity = 0 AND DATE(oh.date_added) = DATE(NOW()) order by quantity desc");

		return ['barallorder' => $querybarallorder->rows, 'barallstore' => $querybarstore->rows, 'bestseller' => $querybestseller->rows, 'totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}

	public function getTotalSummarysByWeek($week) {

		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) AS totaldelivery FROM oc_order_history AS ooh WHERE order_status_id = 3 AND ooh.date_added >= (DATE(NOW()) - INTERVAL 7 DAY)";
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 AND DATE(ooh.date_added) >=  " . $week;
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12 AND DATE(ooh.date_added) >=  " . $week;
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12 AND DATE(ooh.date_added) >=  " . $week;
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5 AND DATE(ooh.date_added) >=  " . $week;
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >=  " . $week;
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2 AND DATE(ooh.date_added) >=  " . $week;
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 2 AND DATE(ooh.date_added) >=  " . $week;
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		// query bar all order
		$querybarallorder = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $week GROUP BY DATE(oh.date_added)");

		//query bar store
		$querybarstore = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $week GROUP BY DATE(oh.date_added)");

		// query best seller
		$querybestseller = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity > 0 AND DATE(oh.date_added) >= $week order by quantity desc");


		return ['barallorder' => $querybarallorder->rows, 'barallstore' => $querybarstore->rows,'bestseller' => $querybestseller->rows, 'totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}

	public function getTotalSummarysByMonth($month) {

		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) as totaldelivery FROM oc_order_history as ooh WHERE order_status_id = 3 AND DATE(ooh.date_added) >= ". $month;
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 AND DATE(ooh.date_added) >= ". $month;
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12 AND DATE(ooh.date_added) >= ". $month;
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12 AND DATE(ooh.date_added) >= ". $month;
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5 AND DATE(ooh.date_added) >= ". $month;
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $month;
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2 AND DATE(ooh.date_added) >= ". $month;
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $month;
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		// query bar all order
		$querybarallorder = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $month GROUP BY DATE(oh.date_added)");

		//query bar store
		$querybarstore = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $month GROUP BY DATE(oh.date_added)");

		// query best seller
		$querybestseller = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity > 0 AND DATE(oh.date_added) >= $month order by quantity desc");

		return ['barallorder' => $querybarallorder->rows, 'barallstore' =>$querybarstore->rows, 'bestseller' => $querybestseller->rows, 'totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}

	public function getTotalSummarysByThisMonth($tmonth) {
		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) as totaldelivery FROM oc_order_history as ooh WHERE order_status_id = 3 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $tmonth;
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		// query bar all order
		$querybarallorder = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $tmonth GROUP BY DATE(oh.date_added)");

		//query bar store
		$querybarstore = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $tmonth GROUP BY DATE(oh.date_added)");

		// query best seller
		$querybestseller = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity > 0 AND DATE(oh.date_added) >= $tmonth order by quantity desc");

		return ['barallorder' => $querybarallorder->rows, 'barallstore' => $querybarstore->rows, 'bestseller' => $querybestseller->rows, 'totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}

	public function getTotalSummarysByLastMonth($lmonth) {
		/* delivery */
		$sqldelivery = "SELECT count(order_history_id) as totaldelivery FROM oc_order_history as ooh WHERE order_status_id = 3 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$querydelivery = $this->db->query($sqldelivery);
		
		$sql_amount_delivery = "SELECT sum(oo.total) as total_amount_delivery FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 3 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$query_amount_delivery = $this->db->query($sql_amount_delivery);

		/* pickup */
		$sqlpickup = "SELECT count(order_history_id) as totalpickup FROM oc_order_history as ooh WHERE order_status_id = 12 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$querypickup = $this->db->query($sqlpickup);
		
		$sql_amount_pickup = "SELECT sum(oo.total) as total_amount_pickup FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 12 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$query_amount_pickup = $this->db->query($sql_amount_pickup);

		/* dinein */
		$sqldinein = "SELECT count(order_history_id) as totaldinein FROM oc_order_history as ooh WHERE order_status_id = 5 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$querydinein = $this->db->query($sqldinein);
		
		$sql_amount_dinein = "SELECT sum(oo.total) as total_amount_dinein FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$query_amount_dinein = $this->db->query($sql_amount_dinein);

		/* point of sales */
		$sqlpos = "SELECT count(order_history_id) as totalpos FROM oc_order_history as ooh WHERE order_status_id = 2 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$querypos = $this->db->query($sqlpos);
		
		$sql_amount_pos = "SELECT sum(oo.total) as total_amount_pos FROM oc_order_history as ooh INNER JOIN oc_order as oo ON oo.order_id = ooh.order_id WHERE ooh.order_status_id = 5 AND DATE(ooh.date_added) >= ". $lmonth;
		
		$query_amount_pos = $this->db->query($sql_amount_pos);

		// query bar all order
		$querybarallorder = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order` as o INNER JOIN `" . DB_PREFIX . "order_history` as oh ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $lmonth GROUP BY DATE(oh.date_added)");

		//query bar store
		$querybarstore = $this->db->query("SELECT count(oh.order_history_id) as quantity, DATE_FORMAT(oh.date_added, '%M %d') as state, SUM(total) as amount FROM `" . DB_PREFIX . "order_history` as oh INNER JOIN `" . DB_PREFIX . "order` as o ON o.order_id = oh.order_id WHERE DATE(oh.date_added) >= $lmonth GROUP BY DATE(oh.date_added)");

		// query best seller
		$querybestseller = $this->db->query("SELECT DISTINCT(op.name) as name FROM `" . DB_PREFIX . "order_product` AS op INNER JOIN `" . DB_PREFIX . "order_history` as oh ON op.order_id = oh.order_id WHERE op.quantity > 0 AND DATE(oh.date_added) >= $lmonth order by quantity desc");

		return ['barallorder' => $querybarallorder->rows, 'barallstore' => $querybarstore->rows, 'bestseller' => $querybestseller->rows, 'totaldelivery' => $querydelivery->rows[0]['totaldelivery'], 'total_amount_delivery' => $query_amount_delivery->rows[0]['total_amount_delivery'], 'totalpickup' => $querypickup->rows[0]['totalpickup'], 'total_amount_pickup' => $query_amount_pickup->rows[0]['total_amount_pickup'], 'totaldinein' => $querydinein->rows[0]['totaldinein'], 'total_amount_dinein' => $query_amount_dinein->rows[0]['total_amount_dinein'], 'totalpos' => $querypos->rows[0]['totalpos'], 'total_amount_pos' => $query_amount_pos->rows[0]['total_amount_pos']];
	}

	
}