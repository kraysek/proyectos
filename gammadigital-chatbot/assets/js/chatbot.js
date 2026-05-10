document.addEventListener('DOMContentLoaded', function() {
    const botImg = document.getElementById('gd-bot-img');
    const toggleBtn = document.getElementById('gd-chat-toggle');
    const chatBox = document.getElementById('gd-chat-box');
    const input = document.getElementById('gd-chat-input');
    const sendBtn = document.getElementById('gd-chat-send');
    const msgsDiv = document.getElementById('gd-chat-msgs');

    // Cargar imagen de GamaBot dinámicamente
    if (typeof gdChatData !== 'undefined' && gdChatData.bot_image) {
        botImg.src = gdChatData.bot_image;
        toggleBtn.innerHTML = '<img src="' + gdChatData.bot_image + '" alt="GamaBot">';
    }

    toggleBtn.addEventListener('click', function() {
        const isHidden = chatBox.style.display === 'none' || chatBox.style.display === '';
        chatBox.style.display = isHidden ? 'block' : 'none';
        if (isHidden && input) input.focus();
    });

    function addMessage(text, isUser) {
        const div = document.createElement('div');
        div.className = isUser ? 'gd-msg gd-user' : 'gd-msg gd-bot';
        // innerHTML permite que los enlaces <a> sean clickeables
        div.innerHTML = text;
        msgsDiv.appendChild(div);
        msgsDiv.scrollTop = msgsDiv.scrollHeight;
    }

    function getResponse(msg) {
        const m = msg.toLowerCase().trim();
        
        // Contexto especial: "sí" después de hablar de logos
        if ((m === 'si' || m === 'sí' || m.includes('porfa')) && sessionStorage.getItem('gd_last_topic') === 'logo') {
            return '🎨 Portafolio: <a href="https://gammadigitalstudio.com/diseno-identidad-visual-fotografo/" target="_blank" style="color:#00ff00;">Ver ejemplos</a>';
        }

        const reglas = (typeof gdChatData !== 'undefined' && Array.isArray(gdChatData.reglas)) ? gdChatData.reglas : [];
        
        for (let regla of reglas) {
            if (Array.isArray(regla.palabras) && regla.palabras.some(p => m.includes(p))) {
                if (regla.palabras.includes('logo') || regla.palabras.includes('logotipo')) {
                    sessionStorage.setItem('gd_last_topic', 'logo');
                }
                return regla.respuesta;
            }
        }
        
        return '🤔 No estoy seguro de entender. ¿Podrías preguntarme sobre <b>Logo</b>, <b>Web</b>, <b>Foto</b> o <b>Ilustración</b>?';
    }

    function sendMessage() {
        const txt = input.value.trim();
        if (!txt) return;
        addMessage(txt, true);
        input.value = '';
        setTimeout(function() { addMessage(getResponse(txt), false); }, 500);
    }

    if (sendBtn) sendBtn.addEventListener('click', sendMessage);
    if (input) input.addEventListener('keypress', function(e) { if (e.key === 'Enter') sendMessage(); });
});
