<?php 

// zzwrap (Project Zugzwang)
// (c) Gustaf Mossakowski, <gustaf@koenige.org> 2008
// Default variables, post config


// -------------------------------------------------------------------------
// Request method
// -------------------------------------------------------------------------

if (empty($zz_setting['http']['allowed'])) {
	$zz_setting['http']['allowed'] = array('GET', 'HEAD', 'POST');
} else {
	// The following REQUEST methods must always be allowed in general:
	if (!in_array('GET', $zz_setting['http']['allowed']))
		$zz_setting['http']['allowed'][] = 'GET';
	if (!in_array('HEAD', $zz_setting['http']['allowed']))
		$zz_setting['http']['allowed'][] = 'HEAD';
}
if (empty($zz_setting['http']['not_allowed'])) {
	$zz_setting['http']['not_allowed'] = array('OPTIONS', 'PUT', 'DELETE', 'TRACE', 'CONNECT');
}

// -------------------------------------------------------------------------
// Hostname, Access via HTTPS or not
// -------------------------------------------------------------------------

if (empty($zz_setting['https'])) $zz_setting['https'] = false;
// HTTPS; zzwrap authentication will always be https
if (!empty($zz_setting['https_urls'])) {
	foreach ($zz_setting['https_urls'] AS $url) {
		// check language strings
		// TODO: add support for language strings at some other position of the URL
		$languages = (!empty($zz_setting['languages_allowed']) ? $zz_setting['languages_allowed'] : array());
		$languages[] = ''; // without language string should be checked always
		foreach ($languages as $lang) {
			if ($lang) $lang = '/'.$lang;
			if ($zz_setting['base'].$lang.strtolower($url) 
				== substr(strtolower($_SERVER['REQUEST_URI']), 0, strlen($zz_setting['base'].$lang.$url))) {
				$zz_setting['https'] = true;
			}
		}
	}
}
// local connections are never made via https
if (!empty($zz_setting['local_access'])) {
	$zz_setting['https'] = false;
	$zz_setting['no_https'] = true;
}
// explicitly do not want https even for authentication (not recommended)
if (!empty($zz_setting['no_https'])) $zz_setting['https'] = false;
else $zz_setting['no_https'] = false;

// allow to choose manually whether one uses https or not
if (!isset($zz_setting['ignore_scheme'])) $zz_setting['ignore_scheme'] = false;
if ($zz_setting['ignore_scheme']) 
	$zz_setting['https'] = (empty($_SERVER['HTTPS']) ? false : true);

if (empty($zz_setting['protocol']))
	$zz_setting['protocol'] 	= 'http'.($zz_setting['https'] ? 's' : '');
if (empty($zz_setting['host_base']))
	$zz_setting['host_base'] 	= $zz_setting['protocol'].'://'.$zz_setting['hostname'];

// -------------------------------------------------------------------------
// Paths
// -------------------------------------------------------------------------

// library
if (empty($zz_setting['lib']))
	$zz_setting['lib']			= $zz_setting['inc'].'/library';
	
// localized includes
if (empty($zz_setting['custom']))	
	$zz_setting['custom'] 	= $zz_setting['inc'].'/custom';

// customized cms includes
if (empty($zz_setting['custom_wrap_dir']))	
	$zz_setting['custom_wrap_dir'] = $zz_setting['custom'].'/zzwrap';

// customized sql queries, db connection
if (empty($zz_setting['custom_wrap_sql_dir']))	
	$zz_setting['custom_wrap_sql_dir'] = $zz_setting['custom'].'/zzwrap_sql';

// customized sql queries, db connection
if (empty($zz_setting['custom_wrap_template_dir']))	
	$zz_setting['custom_wrap_template_dir'] = $zz_setting['inc'].'/templates';

// database connection
if (empty($zz_setting['db_inc']))
	$zz_setting['db_inc']		= $zz_setting['custom_wrap_sql_dir'].'/db.inc.php';

// cms core
if (empty($zz_setting['core']))
	$zz_setting['core']			= $zz_setting['lib'].'/zzwrap';

// zzform path
if (empty($zz_conf['dir']))
	$zz_conf['dir']				= $zz_setting['lib'].'/zzform';
if (empty($zz_conf['dir_custom']))
	$zz_conf['dir_custom']		= $zz_setting['custom'].'/zzform';
if (empty($zz_conf['dir_ext']))
	$zz_conf['dir_ext']			= $zz_setting['lib'];
if (empty($zz_conf['dir_inc']))
	$zz_conf['dir_inc']			= $zz_conf['dir'];

// zzform db scripts
if (empty($zz_conf['form_scripts']))
	$zz_conf['form_scripts']	= $zz_setting['custom'].'/zzbrick_tables';

// local pwd
if (empty($zz_setting['local_pwd']))
	$zz_setting['local_pwd'] = "/Users/pwd.inc";

// -------------------------------------------------------------------------
// Page
// -------------------------------------------------------------------------

// translations
if (!isset($zz_conf['translations_of_fields']))
	$zz_conf['translations_of_fields'] = false;

// breadcrumbs
if (!isset($zz_page['breadcrumbs_separator']))
	$zz_page['breadcrumbs_separator'] = '&gt;';

// page title and project title
if (!isset($zz_page['template_pagetitle']))
	$zz_page['template_pagetitle'] = '%1$s (%2$s)';
if (!isset($zz_page['template_pagetitle_home']))
	$zz_page['template_pagetitle_home'] = '%1$s';

// allowed HTML rel attribute values
if (!isset($zz_setting['html_link_types'])) {
	$zz_setting['html_link_types'] = array('Alternate', 'Stylesheet', 'Start',
		'Next', 'Prev', 'Contents', 'Index', 'Glossary', 'Copyright', 'Chapter',
		'Section', 'Subsection', 'Appendix', 'Help', 'Bookmark');
}

// XML mode? for closing tags
if (!isset($zz_setting['xml_close_empty_tags']))
	$zz_setting['xml_close_empty_tags'] = false;

// Page template
if ($zz_setting['brick_page_templates'] AND empty($zz_page['template'])) {
	$zz_page['template'] = 'page';
}

// -------------------------------------------------------------------------
// Page paths
// -------------------------------------------------------------------------

if (!$zz_setting['brick_page_templates']) {
	// page head
	if (empty($zz_page['head']))
		$zz_page['head']		= $zz_setting['custom_wrap_dir'].'/html-head.inc.php';
	// page foot
	if (empty($zz_page['foot']))			
		$zz_page['foot']		= $zz_setting['custom_wrap_dir'].'/html-foot.inc.php';
}

// -------------------------------------------------------------------------
// Debugging
// -------------------------------------------------------------------------

if (!isset($zz_conf['debug']))
	$zz_conf['debug']			= false;

// -------------------------------------------------------------------------
// Database structure
// -------------------------------------------------------------------------

if (!isset($zz_conf['relations_table']))
	$zz_conf['relations_table']	= $zz_conf['prefix'].'_relations';

if (!empty($zz_conf['logging']) AND !isset($zz_conf['logging_table']))
	$zz_conf['logging_table']	= $zz_conf['prefix'].'_logging';

if (!empty($zz_conf['translations_of_fields']) AND empty($zz_conf['translations_table']))
	$zz_conf['translations_table']  = $zz_conf['prefix'].'_translationfields';


// -------------------------------------------------------------------------
// Error Logging
// -------------------------------------------------------------------------

if (!isset($zz_conf['error_log']['error']))
	$zz_conf['error_log']['error']	= ini_get('error_log');

if (!isset($zz_conf['error_log']['warning']))
	$zz_conf['error_log']['warning']	= ini_get('error_log');

if (!isset($zz_conf['error_log']['notice']))
	$zz_conf['error_log']['notice']	= ini_get('error_log');

if (!isset($zz_conf['log_errors']))
	$zz_conf['log_errors'] 			= ini_get('log_errors');

if (!isset($zz_conf['log_errors_max_len']))
	$zz_conf['log_errors_max_len'] 	= ini_get('log_errors_max_len');

if (!isset($zz_conf['translate_log_encodings']))
	$zz_conf['translate_log_encodings'] = array(
		'iso-8859-2' => 'iso-8859-1'
	);
if (!isset($zz_conf['error_log_post']))
	$zz_conf['error_log_post']	= false;

if (!isset($zz_conf['error_mail_parameters']) AND isset($zz_conf['error_mail_from']))
	$zz_conf['error_mail_parameters'] = '-f '.$zz_conf['error_mail_from'];


// -------------------------------------------------------------------------
// Authentication
// -------------------------------------------------------------------------

if (!isset($zz_setting['authentication_possible']))
	$zz_setting['authentication_possible'] = true;


// -------------------------------------------------------------------------
// Encryption
// -------------------------------------------------------------------------

if (empty($zz_conf['password_encryption'])) 
	$zz_conf['password_encryption'] = 'md5';
if (!isset($zz_conf['password_salt'])) 
	$zz_conf['password_salt'] = '';

?>