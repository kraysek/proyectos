<?php
/**
 * Plugin Name: Gammadigital Chatbot
 * Description: Chatbot profesional con GamaBot, tema neón accesible y reglas en JSON
 * Version: 6.0
 * Author: Julio Ruiz Fierro
 */

if ( ! defined( 'ABSPATH' ) ) exit;

function gd_enqueue_chat_assets() {
    $plugin_url  = plugins_url( '', __FILE__ );
    $plugin_path = plugin_dir_path( __FILE__ );

    wp_enqueue_style( 'gd-chatbot-css', $plugin_url . '/assets/css/chatbot.css', [], '6.0' );
    wp_enqueue_script( 'gd-chatbot-js', $plugin_url . '/assets/js/chatbot.js', [], '6.0', true );

    $json_path = $plugin_path . 'respuestas.json';
    $reglas = file_exists( $json_path ) ? json_decode( file_get_contents( $json_path ), true ) : [];

    wp_localize_script( 'gd-chatbot-js', 'gdChatData', [
        'reglas'    => is_array( $reglas ) ? $reglas : [],
        'bot_image' => $plugin_url . '/img/gamabot.png',
        'version'   => '6.0'
    ]);
}
add_action( 'wp_enqueue_scripts', 'gd_enqueue_chat_assets' );

function gd_render_chat_html() {
    ?>
    <div id="gd-chat-container">
        <div id="gd-chat-box">
            <div id="gd-chat-header">
                <img src="" alt="GamaBot" class="gd-bot-avatar" id="gd-bot-img">
                <span class="gd-bot-name">GamaBot</span>
            </div>
            <div id="gd-chat-msgs">
                <div class="gd-msg gd-bot">¡Hola! Soy GamaBot. ¿En qué puedo ayudarte hoy?</div>
            </div>
            <div id="gd-chat-input-area">
                <input type="text" id="gd-chat-input" placeholder="Escribe tu mensaje...">
                <button id="gd-chat-send">Enviar</button>
            </div>
        </div>
        <button id="gd-chat-toggle"></button>
    </div>
    <?php
}
add_action( 'wp_footer', 'gd_render_chat_html' );
