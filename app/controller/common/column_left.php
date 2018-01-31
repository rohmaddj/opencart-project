
<?php
class ControllerCommonColumnLeft extends Controller {
	public function index() {
		$this->load->language('common/header');
		if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			$this->load->language('common/column_left');
			
	
			$this->load->model('user/user');
	
			$this->load->model('tool/image');

			// adding function from header
			$data['description'] = $this->document->getDescription();
			$data['keywords'] = $this->document->getKeywords();
			$data['links'] = $this->document->getLinks();
			$data['styles'] = $this->document->getStyles();
			$data['scripts'] = $this->document->getScripts();
			$data['lang'] = $this->language->get('code');
			$data['direction'] = $this->language->get('direction');
	
			$user_info = $this->model_user_user->getUser($this->user->getId());

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_order'] = $this->language->get('text_order');
			$data['text_processing_status'] = $this->language->get('text_processing_status');
			$data['text_complete_status'] = $this->language->get('text_complete_status');
			$data['text_return'] = $this->language->get('text_return');
			$data['text_customer'] = $this->language->get('text_customer');
			$data['text_online'] = $this->language->get('text_online');
			$data['text_approval'] = $this->language->get('text_approval');
			$data['text_product'] = $this->language->get('text_product');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_review'] = $this->language->get('text_review');
			$data['text_affiliate'] = $this->language->get('text_affiliate');
			$data['text_store'] = $this->language->get('text_store');
			$data['text_front'] = $this->language->get('text_front');
			$data['text_help'] = $this->language->get('text_help');
			$data['text_homepage'] = $this->language->get('text_homepage');
			$data['text_documentation'] = $this->language->get('text_documentation');
			$data['text_support'] = $this->language->get('text_support');
			$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
			$data['text_logout'] = $this->language->get('text_logout');

			if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
				$data['logged'] = '';

				$data['home'] = $this->url->link('common/dashboard', '', true);
			} else {
				$data['logged'] = true;

				$data['home'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
				$data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], true);

				// Orders
				$this->load->model('sale/order');

				// Processing Orders
				$data['processing_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_processing_status'))));
				$data['processing_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_processing_status')), true);

				// Complete Orders
				$data['complete_status_total'] = $this->model_sale_order->getTotalOrders(array('filter_order_status' => implode(',', $this->config->get('config_complete_status'))));
				$data['complete_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&filter_order_status=' . implode(',', $this->config->get('config_complete_status')), true);

				// Returns
				$this->load->model('sale/return');

				$return_total = $this->model_sale_return->getTotalReturns(array('filter_return_status_id' => $this->config->get('config_return_status_id')));

				$data['return_total'] = $return_total;

				$data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], true);

				// Customers
				$this->load->model('report/customer');

				$data['online_total'] = $this->model_report_customer->getTotalCustomersOnline();

				$data['online'] = $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], true);

				$this->load->model('customer/customer');

				$customer_total = $this->model_customer_customer->getTotalCustomers(array('filter_approved' => false));

				$data['customer_total'] = $customer_total;
				$data['customer_approval'] = $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . '&filter_approved=0', true);

				// Products
				$this->load->model('catalog/product');

				$product_total = $this->model_catalog_product->getTotalProducts(array('filter_quantity' => 0));

				$data['product_total'] = $product_total;

				$data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&filter_quantity=0', true);

				// Reviews
				$this->load->model('catalog/review');

				$review_total = $this->model_catalog_review->getTotalReviews(array('filter_status' => 0));

				$data['review_total'] = $review_total;

				$data['review'] = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . '&filter_status=0', true);

				// Affliate
				$this->load->model('marketing/affiliate');

				$affiliate_total = $this->model_marketing_affiliate->getTotalAffiliates(array('filter_approved' => false));

				$data['affiliate_total'] = $affiliate_total;
				$data['affiliate_approval'] = $this->url->link('marketing/affiliate', 'token=' . $this->session->data['token'] . '&filter_approved=1', true);

				$data['alerts'] = $customer_total + $product_total + $review_total + $return_total + $affiliate_total;

				// Online Stores
				$data['stores'] = array();

				$data['stores'][] = array(
					'name' => $this->config->get('config_name'),
					'href' => HTTP_CATALOG
				);

				$this->load->model('setting/store');

				$results = $this->model_setting_store->getStores();

				foreach ($results as $result) {
					$data['stores'][] = array(
						'name' => $result['name'],
						'href' => $result['url']
					);
				}
			}
	
			if ($user_info) {
				$data['firstname'] = $user_info['firstname'];
				$data['lastname'] = $user_info['lastname'];
	
				$data['user_group'] = $user_info['user_group'];
	
				if (is_file(DIR_IMAGE . $user_info['image'])) {
					$data['image'] = $this->model_tool_image->resize($user_info['image'], 45, 45);
				} else {
					$data['image'] = '';
				}
			} else {
				$data['firstname'] = '';
				$data['lastname'] = '';
				$data['user_group'] = '';
				$data['image'] = '';
			}			
		
			// Create a 3 level menu array
			// Level 2 can not have children
			
			// Menu
			$data['menus'][] = array(
				'id'       => 'menu-dashboard',
				'icon'	   => 'fa-dashboard',
				'name'	   => $this->language->get('text_dashboard'),
				'href'     => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
				'children' => array()
			);

			// Analytics
			$analytics = array();

			if ($this->user->hasPermission('access', 'analytics/summary')) {
				$analytics[] = array(
					'name'		=> $this->language->get('text_summary'),
					'href'		=> $this->url->link('analytics/summary', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'analytics/instore')) {
				$analytics[] = array(
					'name'		=> $this->language->get('text_instore'),
					'href'		=> $this->url->link('analytics/instore', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'analytics/online')) {
				$analytics[] = array(
					'name'		=> $this->language->get('text_online'),
					'href'		=> $this->url->link('analytics/online', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'analytics/webtraffic')) {
				$analytics[] = array(
					'name'		=> $this->language->get('text_webtraffic'),
					'href'		=> $this->url->link('analytics/webtraffic', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'analytics/report')) {
				$analytics[] = array(
					'name'		=> $this->language->get('text_report'),
					'href'		=> $this->url->link('analytics/report', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($analytics) {
				$data['menus'][] = array(
					'id'       => 'menu-analytics',
					'icon'	   => 'fa-bar-chart-o', 
					'name'	   => $this->language->get('text_analytics'),
					'href'     => '',
					'children' => $analytics
				);		
			}
			
			// Catalog
			$catalog = array();
			
			if ($this->user->hasPermission('access', 'catalog/category')) {
				$catalog[] = array(
					'name'	   => $this->language->get('text_category'),
					'href'     => $this->url->link('catalog/category', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);
			}

			if ($this->user->hasPermission('access', 'catalog/menus')) {
				$catalog[] = array(
					'name'		=> $this->language->get('text_menus'),
					'href'		=> $this->url->link('catalog/menus', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}
			
			if ($this->user->hasPermission('access', 'catalog/product')) {
				$catalog[] = array(
					'name'	   => $this->language->get('text_product'),
					'href'     => $this->url->link('catalog/product', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);
			}
			
			
			if ($this->user->hasPermission('access', 'catalog/option')) {
				$catalog[] = array(
					'name'	   => $this->language->get('text_option'),
					'href'     => $this->url->link('catalog/option', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);
			}
			
			if ($catalog) {
				$data['menus'][] = array(
					'id'       => 'menu-catalog',
					'icon'	   => 'fa-tags', 
					'name'	   => $this->language->get('text_catalog'),
					'href'     => '',
					'children' => $catalog
				);		
			}

			// operations
			$operation = array();

			if ($this->user->hasPermission('access', 'operation/order')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_order'),
					'href'		=> $this->url->link('operation/order', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'operation/deliverypickup')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_deliverypickup'),
					'href'		=> $this->url->link('operation/deliverypickup', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'operation/userroles')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_userroles'),
					'href'		=> $this->url->link('operation/userroles', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'operation/finance')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_finance'),
					'href'		=> $this->url->link('operation/finance', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'operation/email')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_email'),
					'href'		=> $this->url->link('operation/email', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'operation/gallery')) {
				$operation[] = array(
					'name'		=> $this->language->get('text_gallery'),
					'href'		=> $this->url->link('operation/gallery', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($operation) {
				$data['menus'][] = array(
					'id'       => 'menu-operation',
					'icon'	   => 'fa-group', 
					'name'	   => $this->language->get('text_operation'),
					'href'     => '',
					'children' => $operation
				);		
			}

			//marketing
			$marketing = array();

			if ($this->user->hasPermission('access', 'marketing/tracker')) {
				$marketing[] = array(
					'name'		=> $this->language->get('text_tracker'),
					'href'		=> $this->url->link('marketing/tracker', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'marketing/facebook')) {
				$marketing[] = array(
					'name'		=> $this->language->get('text_facebook'),
					'href'		=> $this->url->link('marketing/facebook', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'marketing/wechat')) {
				$marketing[] = array(
					'name'		=> $this->language->get('text_wechat'),
					'href'		=> $this->url->link('marketing/wechat', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'marketing/coupon')) {
				$marketing[] = array(
					'name'		=> $this->language->get('text_coupons'),
					'href'		=> $this->url->link('marketing/coupon', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'marketing/voucher')) {
				$marketing[] = array(
					'name'		=> $this->language->get('text_vouchers'),
					'href'		=> $this->url->link('marketing/voucher', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($marketing) {
				$data['menus'][] = array(
					'id'       => 'menu-marketing',
					'icon'	   => 'fa-lastfm', 
					'name'	   => $this->language->get('text_marketing'),
					'href'     => '',
					'children' => $marketing
				);		
			}
	
			// // Extension
			// $extension = array();
			// /*
			// if ($this->user->hasPermission('access', 'extension/store')) {		
			// 	$extension[] = array(
			// 		'name'	   => $this->language->get('text_store'),
			// 		'href'     => $this->url->link('extension/store', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);					
			// }
			// */
			// if ($this->user->hasPermission('access', 'extension/installer')) {		
			// 	$extension[] = array(
			// 		'name'	   => $this->language->get('text_installer'),
			// 		'href'     => $this->url->link('extension/installer', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);					
			// }	
			
			// if ($this->user->hasPermission('access', 'extension/extension')) {		
			// 	$extension[] = array(
			// 		'name'	   => $this->language->get('text_extension'),
			// 		'href'     => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
					
			// if ($this->user->hasPermission('access', 'extension/modification')) {
			// 	$extension[] = array(
			// 		'name'	   => $this->language->get('text_modification'),
			// 		'href'     => $this->url->link('extension/modification', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'extension/event')) {
			// 	$extension[] = array(
			// 		'name'	   => $this->language->get('text_event'),
			// 		'href'     => $this->url->link('extension/event', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
					
			// if ($extension) {					
			// 	$data['menus'][] = array(
			// 		'id'       => 'menu-extension',
			// 		'icon'	   => 'fa-puzzle-piece', 
			// 		'name'	   => $this->language->get('text_extension'),
			// 		'href'     => '',
			// 		'children' => $extension
			// 	);		
			// }
			
			// // Design
			// $design = array();
			
			// if ($this->user->hasPermission('access', 'design/layout')) {
			// 	$design[] = array(
			// 		'name'	   => $this->language->get('text_layout'),
			// 		'href'     => $this->url->link('design/layout', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			// /*
			// if ($this->user->hasPermission('access', 'design/menu')) {
			// 	$design[] = array(
			// 		'name'	   => $this->language->get('text_menu'),
			// 		'href'     => $this->url->link('design/menu', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			// */	
				
			// if ($this->user->hasPermission('access', 'design/theme')) {	
			// 	$design[] = array(
			// 		'name'	   => $this->language->get('text_theme'),
			// 		'href'     => $this->url->link('design/theme', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'design/language')) {
			// 	$design[] = array(
			// 		'name'	   => $this->language->get('text_translation'),
			// 		'href'     => $this->url->link('design/language', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
				
			// if ($this->user->hasPermission('access', 'design/banner')) {
			// 	$design[] = array(
			// 		'name'	   => $this->language->get('text_banner'),
			// 		'href'     => $this->url->link('design/banner', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($design) {
			// 	$data['menus'][] = array(
			// 		'id'       => 'menu-design',
			// 		'icon'	   => 'fa-desktop', 
			// 		'name'	   => $this->language->get('text_design'),
			// 		'href'     => '',
			// 		'children' => $design
			// 	);	
			// }
			
			// // Sales
			// $sale = array();
			
			// if ($this->user->hasPermission('access', 'sale/order')) {
			// 	$sale[] = array(
			// 		'name'	   => $this->language->get('text_order'),
			// 		'href'     => $this->url->link('sale/order', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'sale/recurring')) {	
			// 	$sale[] = array(
			// 		'name'	   => $this->language->get('text_recurring'),
			// 		'href'     => $this->url->link('sale/recurring', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'sale/return')) {
			// 	$sale[] = array(
			// 		'name'	   => $this->language->get('text_return'),
			// 		'href'     => $this->url->link('sale/return', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// // Voucher
			// $voucher = array();
			
			// if ($this->user->hasPermission('access', 'sale/voucher')) {
			// 	$voucher[] = array(
			// 		'name'	   => $this->language->get('text_voucher'),
			// 		'href'     => $this->url->link('sale/voucher', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'sale/voucher_theme')) {
			// 	$voucher[] = array(
			// 		'name'	   => $this->language->get('text_voucher_theme'),
			// 		'href'     => $this->url->link('sale/voucher_theme', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($voucher) {
			// 	$sale[] = array(
			// 		'name'	   => $this->language->get('text_voucher'),
			// 		'href'     => '',
			// 		'children' => $voucher		
			// 	);		
			// }
			
			// if ($sale) {
			// 	$data['menus'][] = array(
			// 		'id'       => 'menu-sale',
			// 		'icon'	   => 'fa-shopping-cart', 
			// 		'name'	   => $this->language->get('text_sale'),
			// 		'href'     => '',
			// 		'children' => $sale
			// 	);
			// }
			
			// Customer
			$customer = array();
			
			if ($this->user->hasPermission('access', 'customer/customer')) {
				$customer[] = array(
					'name'	   => $this->language->get('text_customer'),
					'href'     => $this->url->link('customer/customer', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}
			
			if ($this->user->hasPermission('access', 'customer/member')) {
				$customer[] = array(
					'name'	   => $this->language->get('text_member'),
					'href'     => $this->url->link('customer/member', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);
			}
			
			if ($this->user->hasPermission('access', 'customer/channel')) {		
				$customer[] = array(
					'name'	   => $this->language->get('text_channel'),
					'href'     => $this->url->link('customer/channel', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}
			
			if ($this->user->hasPermission('access', 'customer/review')) {		
				$customer[] = array(
					'name'	   => $this->language->get('text_review'),
					'href'     => $this->url->link('customer/review', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}
			
			if ($this->user->hasPermission('access', 'customer/survey')) {		
				$customer[] = array(
					'name'	   => $this->language->get('text_survey'),
					'href'     => $this->url->link('customer/survey', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}
			
			if ($customer) {
				$data['menus'][] = array(
					'id'       => 'menu-customer',
					'icon'	   => 'fa-user', 
					'name'	   => $this->language->get('text_customer'),
					'href'     => '',
					'children' => $customer
				);	
			}

			//pos menu
			$pos = array();

			if ($this->user->hasPermission('access', 'pos/posmenu')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_posmenu'),
					'href'     => $this->url->link('pos/posmenu', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}

			if ($this->user->hasPermission('access', 'pos/remak')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_remak'),
					'href'     => $this->url->link('pos/remak', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}

			if ($this->user->hasPermission('access', 'pos/addon')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_addon'),
					'href'     => $this->url->link('pos/addon', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}
			
			if ($this->user->hasPermission('access', 'pos/layout')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_layout'),
					'href'     => $this->url->link('pos/layout', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}

			if ($this->user->hasPermission('access', 'pos/commission')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_commission'),
					'href'     => $this->url->link('pos/commission', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}

			if ($this->user->hasPermission('access', 'pos/possetting')) {		
				$pos[] = array(
					'name'	   => $this->language->get('text_possetting'),
					'href'     => $this->url->link('pos/possetting', 'token=' . $this->session->data['token'], true),
					'children' => array()		
				);	
			}

			if ($pos) {
				$data['menus'][] = array(
					'id'       => 'menu-pos',
					'icon'	   => 'fa-cogs', 
					'name'	   => $this->language->get('text_pos'),
					'href'     => '',
					'children' => $pos
				);	
			}

			// setting menu
			$setting = array();

			if ($this->user->hasPermission('access', 'setting/company')) {
				$setting[] = array(
					'name'		=> $this->language->get('text_company'),
					'href'		=> $this->url->link('setting/company', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'setting/store')) {
				$setting[] = array(
					'name'		=> $this->language->get('text_store'),
					'href'		=> $this->url->link('setting/store', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'setting/shipping')) {
				$setting[] = array(
					'name'		=> $this->language->get('text_shipping'),
					'href'		=> $this->url->link('setting/shipping', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($this->user->hasPermission('access', 'setting/payment')) {
				$setting[] = array(
					'name'		=> $this->language->get('text_payment'),
					'href'		=> $this->url->link('setting/payment', 'token=' . $this->session->data['token'], true),
					'children'	=> array()
				);
			}

			if ($setting) {
				$data['menus'][] = array(
					'id'       => 'menu-setting',
					'icon'	   => 'fa-gear', 
					'name'	   => $this->language->get('text_setting'),
					'href'     => '',
					'children' => $setting
				);		
			}

			// // System
			// $system = array();
			
			// if ($this->user->hasPermission('access', 'setting/setting')) {
			// 	$system[] = array(
			// 		'name'	   => $this->language->get('text_setting'),
			// 		'href'     => $this->url->link('setting/store', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
		
			// // Users
			// $user = array();
			
			// if ($this->user->hasPermission('access', 'user/user')) {
			// 	$user[] = array(
			// 		'name'	   => $this->language->get('text_users'),
			// 		'href'     => $this->url->link('user/user', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'user/user_permission')) {	
			// 	$user[] = array(
			// 		'name'	   => $this->language->get('text_user_group'),
			// 		'href'     => $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'user/api')) {		
			// 	$user[] = array(
			// 		'name'	   => $this->language->get('text_api'),
			// 		'href'     => $this->url->link('user/api', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($user) {
			// 	$system[] = array(
			// 		'name'	   => $this->language->get('text_users'),
			// 		'href'     => '',
			// 		'children' => $user		
			// 	);
			// }
			
			// // Localisation
			// $localisation = array();
			
			// if ($this->user->hasPermission('access', 'localisation/location')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_location'),
			// 		'href'     => $this->url->link('localisation/location', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/language')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_language'),
			// 		'href'     => $this->url->link('localisation/language', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/currency')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_currency'),
			// 		'href'     => $this->url->link('localisation/currency', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/stock_status')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_stock_status'),
			// 		'href'     => $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/order_status')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_order_status'),
			// 		'href'     => $this->url->link('localisation/order_status', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// // Returns
			// $return = array();
			
			// if ($this->user->hasPermission('access', 'localisation/return_status')) {
			// 	$return[] = array(
			// 		'name'	   => $this->language->get('text_return_status'),
			// 		'href'     => $this->url->link('localisation/return_status', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/return_action')) {
			// 	$return[] = array(
			// 		'name'	   => $this->language->get('text_return_action'),
			// 		'href'     => $this->url->link('localisation/return_action', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);		
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/return_reason')) {
			// 	$return[] = array(
			// 		'name'	   => $this->language->get('text_return_reason'),
			// 		'href'     => $this->url->link('localisation/return_reason', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($return) {	
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_return'),
			// 		'href'     => '',
			// 		'children' => $return		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/country')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_country'),
			// 		'href'     => $this->url->link('localisation/country', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/zone')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_zone'),
			// 		'href'     => $this->url->link('localisation/zone', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/geo_zone')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_geo_zone'),
			// 		'href'     => $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// // Tax		
			// $tax = array();
			
			// if ($this->user->hasPermission('access', 'localisation/tax_class')) {
			// 	$tax[] = array(
			// 		'name'	   => $this->language->get('text_tax_class'),
			// 		'href'     => $this->url->link('localisation/tax_class', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/tax_rate')) {
			// 	$tax[] = array(
			// 		'name'	   => $this->language->get('text_tax_rate'),
			// 		'href'     => $this->url->link('localisation/tax_rate', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($tax) {	
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_tax'),
			// 		'href'     => '',
			// 		'children' => $tax		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/length_class')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_length_class'),
			// 		'href'     => $this->url->link('localisation/length_class', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'localisation/weight_class')) {
			// 	$localisation[] = array(
			// 		'name'	   => $this->language->get('text_weight_class'),
			// 		'href'     => $this->url->link('localisation/weight_class', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($localisation) {																
			// 	$system[] = array(
			// 		'name'	   => $this->language->get('text_localisation'),
			// 		'href'     => '',
			// 		'children' => $localisation	
			// 	);
			// }
			
			// // Tools	
			// $tool = array();
			
			// if ($this->user->hasPermission('access', 'tool/upload')) {
			// 	$tool[] = array(
			// 		'name'	   => $this->language->get('text_upload'),
			// 		'href'     => $this->url->link('tool/upload', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'tool/backup')) {
			// 	$tool[] = array(
			// 		'name'	   => $this->language->get('text_backup'),
			// 		'href'     => $this->url->link('tool/backup', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'tool/log')) {
			// 	$tool[] = array(
			// 		'name'	   => $this->language->get('text_log'),
			// 		'href'     => $this->url->link('tool/log', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()		
			// 	);
			// }
			
			// if ($tool) {
			// 	$system[] = array(
			// 		'name'	   => $this->language->get('text_tools'),
			// 		'href'     => '',
			// 		'children' => $tool	
			// 	);
			// }
			
			// if ($system) {
			// 	$data['menus'][] = array(
			// 		'id'       => 'menu-system',
			// 		'icon'	   => 'fa-cog', 
			// 		'name'	   => $this->language->get('text_system'),
			// 		'href'     => '',
			// 		'children' => $system
			// 	);
			// }
			
			// // Report
			// $report = array();
			
			// // Report Sales
			// $report_sale = array();	
			
			// if ($this->user->hasPermission('access', 'report/sale_order')) {
			// 	$report_sale[] = array(
			// 		'name'	   => $this->language->get('text_report_sale_order'),
			// 		'href'     => $this->url->link('report/sale_order', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/sale_tax')) {
			// 	$report_sale[] = array(
			// 		'name'	   => $this->language->get('text_report_sale_tax'),
			// 		'href'     => $this->url->link('report/sale_tax', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()	
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/sale_shipping')) {
			// 	$report_sale[] = array(
			// 		'name'	   => $this->language->get('text_report_sale_shipping'),
			// 		'href'     => $this->url->link('report/sale_shipping', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()	
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/sale_return')) {	
			// 	$report_sale[] = array(
			// 		'name'	   => $this->language->get('text_report_sale_return'),
			// 		'href'     => $this->url->link('report/sale_return', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);	
			// }
			
			// if ($this->user->hasPermission('access', 'report/sale_coupon')) {		
			// 	$report_sale[] = array(
			// 		'name'	   => $this->language->get('text_report_sale_coupon'),
			// 		'href'     => $this->url->link('report/sale_coupon', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($report_sale) {
			// 	$report[] = array(
			// 		'name'	   => $this->language->get('text_report_sale'),
			// 		'href'     => '',
			// 		'children' => $report_sale
			// 	);			
			// }
			
			// // Report Products			
			// $report_product = array();	
			
			// if ($this->user->hasPermission('access', 'report/product_viewed')) {
			// 	$report_product[] = array(
			// 		'name'	   => $this->language->get('text_report_product_viewed'),
			// 		'href'     => $this->url->link('report/product_viewed', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()	
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/product_purchased')) {
			// 	$report_product[] = array(
			// 		'name'	   => $this->language->get('text_report_product_purchased'),
			// 		'href'     => $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()	
			// 	);
			// }
			
			// if ($report_product) {	
			// 	$report[] = array(
			// 		'name'	   => $this->language->get('text_report_product'),
			// 		'href'     => '',
			// 		'children' => $report_product	
			// 	);		
			// }
			
			// // Report Customers				
			// $report_customer = array();
			
			// if ($this->user->hasPermission('access', 'report/customer_online')) {	
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_online'),
			// 		'href'     => $this->url->link('report/customer_online', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/customer_activity')) {
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_activity'),
			// 		'href'     => $this->url->link('report/customer_activity', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }

			// if ($this->user->hasPermission('access', 'report/customer_search')) {
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_search'),
			// 		'href'     => $this->url->link('report/customer_search', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }

			// if ($this->user->hasPermission('access', 'report/customer_order')) {	
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_order'),
			// 		'href'     => $this->url->link('report/customer_order', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/customer_reward')) {
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_reward'),
			// 		'href'     => $this->url->link('report/customer_reward', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/customer_credit')) {
			// 	$report_customer[] = array(
			// 		'name'	   => $this->language->get('text_report_customer_credit'),
			// 		'href'     => $this->url->link('report/customer_credit', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($report_customer) {	
			// 	$report[] = array(
			// 		'name'	   => $this->language->get('text_report_customer'),
			// 		'href'     => '',
			// 		'children' => $report_customer	
			// 	);
			// }
			
			// // Report Marketing			
			// $report_marketing = array();			
			
			// if ($this->user->hasPermission('access', 'report/marketing')) {
			// 	$report_marketing[] = array(
			// 		'name'	   => $this->language->get('text_report_marketing'),
			// 		'href'     => $this->url->link('report/marketing', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);
			// }
			
			// if ($this->user->hasPermission('access', 'report/affiliate')) {
			// 	$report_marketing[] = array(
			// 		'name'	   => $this->language->get('text_report_affiliate'),
			// 		'href'     => $this->url->link('report/affiliate', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);		
			// }
			
			// if ($this->user->hasPermission('access', 'report/affiliate_activity')) {
			// 	$report_marketing[] = array(
			// 		'name'	   => $this->language->get('text_report_affiliate_activity'),
			// 		'href'     => $this->url->link('report/affiliate_activity', 'token=' . $this->session->data['token'], true),
			// 		'children' => array()
			// 	);		
			// }
			
			// if ($report_marketing) {	
			// 	$report[] = array(
			// 		'name'	   => $this->language->get('text_report_marketing'),
			// 		'href'     => '',
			// 		'children' => $report_marketing	
			// 	);		
			// }
			
			// if ($report) {	
			// 	$data['menus'][] = array(
			// 		'id'       => 'menu-report',
			// 		'icon'	   => 'fa-bar-chart-o', 
			// 		'name'	   => $this->language->get('text_reports'),
			// 		'href'     => '',
			// 		'children' => $report
			// 	);	
			// }		
			
			// move to header.php
			

			return $this->load->view('common/column_left', $data);
		}
	}
}