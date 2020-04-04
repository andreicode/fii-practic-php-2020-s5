<?php
/**
 * Setările de bază pentru WordPress.
 *
 * Acest fișier este folosit la crearea wp-config.php în timpul procesului de instalare.
 * Folosirea interfeței web nu este obligatorie, acest fișier poate fi copiat
 * sub numele de „wp-config.php”, iar apoi populate toate detaliile.
 *
 * Acest fișier conține următoarele configurări:
 *
 * * setările MySQL
 * * cheile secrete
 * * prefixul pentru tabele
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Setările MySQL: aceste informații pot fi obținute de la serviciile de găzduire ** //
/** Numele bazei de date pentru WordPress */
define( 'DB_NAME', 'wordpress' );

/** Numele de utilizator MySQL */
define( 'DB_USER', 'root' );

/** Parola utilizatorului MySQL */
define( 'DB_PASSWORD', '' );

/** Adresa serverului MySQL */
define( 'DB_HOST', 'localhost' );

/** Setul de caractere pentru tabelele din baza de date. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Schema pentru unificare. Nu face modificări dacă nu ești sigur. */
define('DB_COLLATE', '');

/**#@+
 * Cheile unice pentru autentificare
 *
 * Modifică conținutul fiecărei chei pentru o frază unică.
 * Acestea pot fi generate folosind {@link https://api.wordpress.org/secret-key/1.1/salt/ serviciul pentru chei de pe WordPress.org}
 * Pentru a invalida toate cookie-urile poți schimba aceste valori în orice moment. Aceasta va forța toți utilizatorii să se autentifice din nou.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'j,qE]YSY/3:yAoLIPP*ynOn9f~2pZEUP;~[J$*-4E[VbbiTL!%uHA$}CWJrubTkR' );
define( 'SECURE_AUTH_KEY',  'S2#Qp.5ZYe<A@+@7};7CG{_xT!qA-DIPX:hnf_c;[}_GA}R|uB|nbClOBo[~uG@Z' );
define( 'LOGGED_IN_KEY',    ')p}f/.8@xWbAIAkqp/{/Ch[PvGP4w}f@3HBk>x>f2H&Rv!o13,)U@X/&nD=H+Hc#' );
define( 'NONCE_KEY',        'r3o[k<LRJ%Zc([Yhz4U<4Z<[O;|wr(xFw>pK%-7Q1)=4$rrz=XT03ixO)8x<=.Y%' );
define( 'AUTH_SALT',        'c56Y]PR5K1fQ1@#W-$veEK>#yt$NHN>aS0^R[r/dMTo6|)x(brKB{YdJ/ b}Qr$,' );
define( 'SECURE_AUTH_SALT', '1tb=a`N1r&X<R5b,Y+at3nEu?|PhG{UzT];84$dC8VgW$Y)*.112aX?a1A.&-Lf{' );
define( 'LOGGED_IN_SALT',   '}k#JMyqa(e6H/h6&!p]s=hEs.@]&T! B8H_u5W?>4aA/`C.]t]vz!KRf[ZYa]CIW' );
define( 'NONCE_SALT',       '>6lSX(zmIDsr[+Rn=7p V{ML6?[#,{KG~$(goD>Z[itQKCirjn2<ZJ@f{cI6/~FM' );

/**#@-*/

/**
 * Prefixul tabelelor din MySQL
 *
 * Acest lucru permite instalarea mai multor instanțe WordPress folosind aceeași bază de date
 * dacă prefixul este diferit pentru fiecare instanță. Sunt permise doar cifre, litere și caracterul liniuță de subliniere.
 */
$table_prefix = 'wp_';

/**
 * Pentru dezvoltatori: WordPress în mod de depanare.
 *
 * Setează cu true pentru a permite afișarea notificărilor în timpul dezvoltării.
 * Este recomadată folosirea modului WP_DEBUG în timpul dezvoltării modulelor și
 * a șabloanelor/temelor în mediile personale de dezvoltare.
 *
 * Pentru detalii despre alte constante ce pot fi utilizate în timpul depanării,
 * vizitează Codex-ul.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Asta e tot, am terminat cu editarea. Spor! */

/** Calea absolută spre directorul WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Setează variabilele WordPress și fișierele incluse. */
require_once(ABSPATH . 'wp-settings.php');
