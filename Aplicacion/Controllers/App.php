<?php
/**
 * Controlador Padre
 * aqui va toda la logica en comun que necesiten
 *  los controladores que extienden de el
 */

namespace App\Controllers;

use Jida\Core\Controller;
use App\Config\Configuracion;

class App extends Controller {

    function __construct() {

        parent::__construct();

        $this->layout('principal.tpl.php');

        $this->data([
            'nombreApp' => Configuracion::NOMBRE_APP,
            'urlBase'   => Configuracion::URL_BASE
        ]);

    }

}
