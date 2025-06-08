<?php
// api/ApiClient.php
require_once 'vendor/autoload.php';

class ApiClient {
    private $client;

    public function __construct() {
        $this->client = new GuzzleHttp\Client([
            'base_uri' => 'https://sistemas.oefa.gob.pe/', // Base fija
            'verify' => false, // Solo para desarrollo (sin SSL válido)
        ]);
    }

    /**
     * Obtiene datos de la API.
     * @param string $codigo Ejemplo: "42424242" (único parámetro variable)
     */
    public function getDatos($codigo) {
        try {
            $response = $this->client->request('GET', "mpv-backend/persona/N/{$codigo}", [
                'headers' => [
                    'Accept' => 'application/json', // Ajusta si la API usa XML
                ]
            ]);
            
            return json_decode($response->getBody(), true);

        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
?>

