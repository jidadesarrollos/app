<?php
/**
 * Controlador Padre
 * aqui va toda la logica en comun que necesiten
 *  los controladores que extienden de el
 */

namespace App\Controllers;

use Jida\Componentes\Traductor;
use Jida\Helpers\Debug;

class App extends \Jida\Core\Controller {

    function __construct () {

        parent::__construct();

        $this->layout('principal.tpl.php');

        if (!$this->idioma) {
            $this->idioma = "es";
        }

        $traductor = new Traductor($this->idioma);

        $this->data([
                        "traductor" => $traductor
                    ]);

    }

}
