<?php
/**
 * Clase Modelo
 *
 * @author Julio Rodriguez
 * @package
 * @version
 * @category
 */

namespace App\Config;

class Mail {

    public $index = [
        'Username'   => 'pruebas@jidadesarrollos.com',
        'Password'   => 'pru3b45',
        'From'       => 'pruebas@jidadesarrollos.com',
        'FromName'   => Configuracion::NOMBRE_APP,
        'Host'       => 'gtr.websitewelcome.com',
        'Port'       => 465,
        'SMTPSecure' => 'ssl'
    ];

    public $data = [
        'nombre_app' => Configuracion::NOMBRE_APP,
        'url_app'    => Configuracion::URL_BASE,
        'logo_app'   => Configuracion::URL_BASE . '/htdocs/img/logo.png',
    ];

}
