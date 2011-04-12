<?php 

// zzwrap (Project Zugzwang)
// (c) Gustaf Mossakowski, <gustaf@koenige.org> 2007
// Main script


// --------------------------------------------------------------------------
// Initalize parameters, set global variables
// --------------------------------------------------------------------------

global $zz_setting;		// settings for zzwrap and zzbrick
global $zz_conf;		// settings for zzform
global $zz_page;		// page variables
global $zz_access;		// access variables

// --------------------------------------------------------------------------
// Include required files
// --------------------------------------------------------------------------

if (empty($zz_setting['lib']))
	$zz_setting['lib']			= $zz_setting['inc'].'/library';
if (empty($zz_setting['core']))
	$zz_setting['core'] = $zz_setting['lib'].'/zzwrap';
require_once $zz_setting['core'].'/defaults.inc.php';	// set default variables
require_once $zz_setting['core'].'/errorhandling.inc.php';	// CMS errorhandling
require_once $zz_setting['db_inc']; // Establish database connection
require_once $zz_setting['core'].'/core.inc.php';	// CMS core scripts
require_once $zz_setting['core'].'/page.inc.php';	// CMS page scripts
if (!empty($zz_conf['error_503'])) wrap_error($zz_conf['error_503'], E_USER_ERROR);	// exit for maintenance reasons

if (file_exists($zz_setting['custom_wrap_dir'].'/_functions.inc.php'))
	require_once $zz_setting['custom_wrap_dir'].'/_functions.inc.php';

wrap_check_http_request_method();
wrap_remove_query_strings();
wrap_check_db_connection();

// Secret Key für Vorschaufunktion, damit auch noch nicht zur
// Veröffentlichung freigegebene Seiten angeschaut werden können.
if (!empty($zz_setting['secret_key']) AND empty($zz_access['wrap_preview']))
	$zz_access['wrap_preview'] = wrap_test_secret_key($zz_setting['secret_key']);

// Sprachcode etc. steht evtl. in URL
if ($zz_conf['translations_of_fields']) {
	$zz_page['url']['full'] = wrap_prepare_url($zz_page['url']['full']);
}
// Eintrag in Datenbank finden, nach URL
// wenn nicht gefunden, dann URL abschneiden, Sternchen anfuegen und abgeschnittene
// Werte in Parameter-Array schreiben
$zz_page['db'] = wrap_look_for_page($zz_conf, $zz_access, $zz_page);

// Check whether we need HTTPS or not, redirect if necessary
wrap_check_https($zz_page, $zz_setting);

// --------------------------------------------------------------------------
// include modules
// --------------------------------------------------------------------------

// Functions which may be needed for login
if (file_exists($zz_setting['custom_wrap_dir'].'/start.inc.php'))
	require_once $zz_setting['custom_wrap_dir'].'/start.inc.php';

// modules may change page language ($page['lang']), so include language functions here
require_once $zz_setting['core'].'/language.inc.php';	// CMS language
if ($zz_setting['authentification_possible']) {
	require_once $zz_setting['core'].'/auth.inc.php';	// CMS authentification
	wrap_auth();
}

// Caching?
if (!empty($zz_setting['cache']) AND !empty($zz_setting['cache_age'])
	AND empty($_SESSION) AND empty($_POST)) { // TODO: check if we can start this earlier
	wrap_send_cache($zz_setting['cache_age']);
}

// include standard functions (e. g. markup languages)
// Standardfunktionen einbinden (z. B. Markup-Sprachen)
if (!empty($zz_setting['standard_extensions']))	
	foreach ($zz_setting['standard_extensions'] as $function)
		require_once $zz_setting['lib'].'/'.$function.'.php';
require_once $zz_conf['dir_inc'].'/numbers.inc.php';
if (file_exists($zz_setting['custom_wrap_dir'].'/_settings_post_login.inc.php'))
	require_once $zz_setting['custom_wrap_dir'].'/_settings_post_login.inc.php';

// --------------------------------------------------------------------------
// on error exit, after all files are included
// --------------------------------------------------------------------------

// Falls kein Eintrag in Datenbank, Umleitungen pruefen, ggf. 404 Fehler ausgeben.
if (!$zz_page['db']) wrap_quit();

// --------------------------------------------------------------------------
// puzzle page elements together
// --------------------------------------------------------------------------

wrap_translate_page();
$page = wrap_get_page();

// output of content
if ($zz_setting['brick_page_templates'] == true) {
	// use wrap templates
	wrap_htmlout_page($page);
} else {
	wrap_htmlout_page_without_templates($page);
}
exit;

?>