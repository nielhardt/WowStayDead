local Locales = {
    enUS = {},
    deDE = {},
    frFR = {},
    esES = {},
    esMX = {},
    itIT = {},
    ptBR = {},
    ruRU = {},
}

STAYDEAD_LOCALES = Locales

-- English (default)
local L = Locales.enUS

L["SETTINGS_HEADER_GENERAL"] = "General Settings"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Configure how the addon prevents spirit releases"
L["SETTINGS_HEADER_BLOCK"] = "Block Settings"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Choose which buttons to block"
L["SETTINGS_HEADER_LOCATION"] = "Location Settings"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Choose where the addon is active"

L["SETTINGS_ENABLE_ADDON"] = "Enable Addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Enable or disable all addon functionality"

L["SETTINGS_KEY_MODIFIER"] = "Required Key Modifier"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Which key must be held down to release spirit (or None for timer only)"
L["SETTINGS_KEY_NONE"] = "None"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "SHIFT"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Delay Timer (seconds)"
L["SETTINGS_TIMER_TOOLTIP"] = "Number of seconds to delay before allowing release (0 to disable timer)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Safety Timeout (seconds)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Always allow release after this many seconds, as a safety net in case of addon errors (0 to disable)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Block Soulstone / Reincarnation"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Also block the Soulstone and Reincarnation buttons"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Enable in Open World"
L["SETTINGS_LOCATION_DELVES"] = "Enable in Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Enable in Battlegrounds"
L["SETTINGS_LOCATION_DUNGEONS"] = "Enable in Dungeons"
L["SETTINGS_LOCATION_RAIDS"] = "Enable in Raids"

L["KEEP_HOLDING"] = "|cffffcc00Keep holding %s|r"
L["DO_NOT_RELEASE"] = "|cffff0000DO NOT RELEASE|r"
L["HOLD_TO_RELEASE"] = "Hold %s to Release"
L["WAIT_TO_RELEASE"] = "|cffffcc00Wait to release|r"
L["READY_IN"] = "Ready in %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Slash Commands"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Useful commands you can type in chat"
L["SETTINGS_CMD_OPEN"] = "Open this settings panel"
L["SETTINGS_CMD_DEBUG"] = "Toggle debug logging in chat"
L["SETTINGS_CMD_RESET"] = "Force restore release buttons if stuck"

-- German (deDE)
L = Locales.deDE

L["SETTINGS_HEADER_GENERAL"] = "Allgemeine Einstellungen"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Konfiguriere, wie das Addon Geistfreigaben verhindert"
L["SETTINGS_HEADER_BLOCK"] = "Blockierungseinstellungen"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Wähle, welche Buttons blockiert werden"
L["SETTINGS_HEADER_LOCATION"] = "Standorteinstellungen"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Wähle, wo das Addon aktiv ist"

L["SETTINGS_ENABLE_ADDON"] = "Addon aktivieren"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Alle Addon-Funktionen aktivieren oder deaktivieren"

L["SETTINGS_KEY_MODIFIER"] = "Erforderliche Modifikatortaste"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Welche Taste muss gedrückt werden, um den Geist freizugeben (oder Keine nur für Timer)"
L["SETTINGS_KEY_NONE"] = "Keine"
L["SETTINGS_KEY_CTRL"] = "STRG"
L["SETTINGS_KEY_SHIFT"] = "UMSCHALT"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Verzögerungstimer (Sekunden)"
L["SETTINGS_TIMER_TOOLTIP"] = "Anzahl der Sekunden Verzögerung vor der Freigabe (0 zum Deaktivieren)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Sicherheits-Timeout (Sekunden)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Freigabe nach dieser Anzahl Sekunden immer erlauben, als Sicherheitsnetz bei Addon-Fehlern (0 zum Deaktivieren)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Seelenstein / Reinkarnation blockieren"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Auch die Seelenstein- und Reinkarnation-Buttons blockieren"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "In offener Welt aktivieren"
L["SETTINGS_LOCATION_DELVES"] = "In Tiefen aktivieren"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "In Schlachtfeldern aktivieren"
L["SETTINGS_LOCATION_DUNGEONS"] = "In Dungeons aktivieren"
L["SETTINGS_LOCATION_RAIDS"] = "In Schlachtzügen aktivieren"

L["KEEP_HOLDING"] = "|cffffcc00Halte %s weiterhin gedrückt|r"
L["DO_NOT_RELEASE"] = "|cffff0000NICHT FREIGEBEN|r"
L["HOLD_TO_RELEASE"] = "%s halten zum Freigeben"
L["WAIT_TO_RELEASE"] = "|cffffcc00Warten zum Freigeben|r"
L["READY_IN"] = "Bereit in %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Chatbefehle"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Nützliche Befehle für den Chat"
L["SETTINGS_CMD_OPEN"] = "Dieses Einstellungsfenster öffnen"
L["SETTINGS_CMD_DEBUG"] = "Debug-Protokollierung im Chat umschalten"
L["SETTINGS_CMD_RESET"] = "Freigabe-Buttons erzwungen wiederherstellen"

-- French (frFR)
L = Locales.frFR
L["SETTINGS_HEADER_GENERAL"] = "Param\195\168tres g\195\169n\195\169raux"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Configurer comment l'addon emp\195\170che la lib\195\169ration d'esprit"
L["SETTINGS_HEADER_BLOCK"] = "Param\195\168tres de blocage"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Choisir quels boutons bloquer"
L["SETTINGS_HEADER_LOCATION"] = "Param\195\168tres de lieu"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Choisir o\195\185 l'addon est actif"
L["SETTINGS_ENABLE_ADDON"] = "Activer l'addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Activer ou désactiver toutes les fonctionnalités de l'addon"

L["SETTINGS_KEY_MODIFIER"] = "Touche modificatrice requise"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Quelle touche doit être maintenue pour libérer l'esprit (ou Aucune pour le minuteur uniquement)"
L["SETTINGS_KEY_NONE"] = "Aucune"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "MAJ"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Minuteur de délai (secondes)"
L["SETTINGS_TIMER_TOOLTIP"] = "Nombre de secondes de délai avant d'autoriser la libération (0 pour désactiver)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Délai de sécurité (secondes)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Toujours autoriser la libération après ce nombre de secondes, en cas d'erreur de l'addon (0 pour désactiver)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Bloquer Pierre d'âme / Réincarnation"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Bloquer également les boutons Pierre d'âme et Réincarnation"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Activer en monde ouvert"
L["SETTINGS_LOCATION_DELVES"] = "Activer dans les Gouffres"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Activer dans les champs de bataille"
L["SETTINGS_LOCATION_DUNGEONS"] = "Activer dans les donjons"
L["SETTINGS_LOCATION_RAIDS"] = "Activer dans les raids"

L["KEEP_HOLDING"] = "|cffffcc00Maintenez %s enfoncé|r"
L["DO_NOT_RELEASE"] = "|cffff0000NE PAS LIBÉRER|r"
L["HOLD_TO_RELEASE"] = "Maintenez %s pour libérer"
L["WAIT_TO_RELEASE"] = "|cffffcc00Attendez pour libérer|r"
L["READY_IN"] = "Prêt dans %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Commandes"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Commandes utiles à taper dans le chat"
L["SETTINGS_CMD_OPEN"] = "Ouvrir ce panneau de paramètres"
L["SETTINGS_CMD_DEBUG"] = "Activer/désactiver le journal de débogage"
L["SETTINGS_CMD_RESET"] = "Forcer la restauration des boutons de libération"

-- Spanish (esES/esMX)
L = Locales.esES

L["SETTINGS_HEADER_GENERAL"] = "Ajustes generales"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Configurar c\195\179mo el addon previene la liberaci\195\179n de esp\195\173ritu"
L["SETTINGS_HEADER_BLOCK"] = "Ajustes de bloqueo"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Elegir qu\195\169 botones bloquear"
L["SETTINGS_HEADER_LOCATION"] = "Ajustes de ubicaci\195\179n"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Elegir d\195\179nde el addon est\195\161 activo"

L["SETTINGS_ENABLE_ADDON"] = "Activar addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Activar o desactivar toda la funcionalidad del addon"

L["SETTINGS_KEY_MODIFIER"] = "Tecla modificadora requerida"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Qué tecla debe mantenerse presionada para liberar el espíritu (o Ninguna solo para temporizador)"
L["SETTINGS_KEY_NONE"] = "Ninguna"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "MAYÚS"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Temporizador de retraso (segundos)"
L["SETTINGS_TIMER_TOOLTIP"] = "Número de segundos de retraso antes de permitir la liberación (0 para desactivar)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Tiempo de seguridad (segundos)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Siempre permitir la liberación después de estos segundos, como red de seguridad en caso de errores del addon (0 para desactivar)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Bloquear Piedra de alma / Reencarnación"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "También bloquear los botones de Piedra de alma y Reencarnación"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Activar en mundo abierto"
L["SETTINGS_LOCATION_DELVES"] = "Activar en Profundidades"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Activar en campos de batalla"
L["SETTINGS_LOCATION_DUNGEONS"] = "Activar en mazmorras"
L["SETTINGS_LOCATION_RAIDS"] = "Activar en bandas"

L["KEEP_HOLDING"] = "|cffffcc00Sigue manteniendo %s|r"
L["DO_NOT_RELEASE"] = "|cffff0000NO LIBERAR|r"
L["HOLD_TO_RELEASE"] = "Mantén %s para liberar"
L["WAIT_TO_RELEASE"] = "|cffffcc00Espera para liberar|r"
L["READY_IN"] = "Listo en %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Comandos"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Comandos útiles para escribir en el chat"
L["SETTINGS_CMD_OPEN"] = "Abrir este panel de ajustes"
L["SETTINGS_CMD_DEBUG"] = "Alternar registro de depuración en el chat"
L["SETTINGS_CMD_RESET"] = "Forzar restauración de botones de liberación"

-- Mexican Spanish shares the same translations as Spanish
Locales.esMX = Locales.esES

-- Italian (itIT)
L = Locales.itIT
L["SETTINGS_HEADER_GENERAL"] = "Impostazioni generali"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Configura come l'addon previene il rilascio dello spirito"
L["SETTINGS_HEADER_BLOCK"] = "Impostazioni di blocco"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Scegli quali pulsanti bloccare"
L["SETTINGS_HEADER_LOCATION"] = "Impostazioni posizione"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Scegli dove l'addon \195\168 attivo"
L["SETTINGS_ENABLE_ADDON"] = "Attiva addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Attiva o disattiva tutte le funzionalità dell'addon"

L["SETTINGS_KEY_MODIFIER"] = "Tasto modificatore richiesto"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Quale tasto deve essere tenuto premuto per rilasciare lo spirito (o Nessuno solo per timer)"
L["SETTINGS_KEY_NONE"] = "Nessuno"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "MAIUSC"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Timer di ritardo (secondi)"
L["SETTINGS_TIMER_TOOLTIP"] = "Numero di secondi di ritardo prima di consentire il rilascio (0 per disattivare)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Timeout di sicurezza (secondi)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Consenti sempre il rilascio dopo questi secondi, come rete di sicurezza in caso di errori dell'addon (0 per disattivare)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Blocca Pietra dell'anima / Reincarnazione"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Blocca anche i pulsanti Pietra dell'anima e Reincarnazione"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Attiva nel mondo aperto"
L["SETTINGS_LOCATION_DELVES"] = "Attiva nelle Profondità"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Attiva nei campi di battaglia"
L["SETTINGS_LOCATION_DUNGEONS"] = "Attiva nelle spedizioni"
L["SETTINGS_LOCATION_RAIDS"] = "Attiva nelle incursioni"

L["KEEP_HOLDING"] = "|cffffcc00Continua a tenere premuto %s|r"
L["DO_NOT_RELEASE"] = "|cffff0000NON RILASCIARE|r"
L["HOLD_TO_RELEASE"] = "Tieni premuto %s per rilasciare"
L["WAIT_TO_RELEASE"] = "|cffffcc00Attendi per rilasciare|r"
L["READY_IN"] = "Pronto tra %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Comandi"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Comandi utili da digitare nella chat"
L["SETTINGS_CMD_OPEN"] = "Aprire questo pannello impostazioni"
L["SETTINGS_CMD_DEBUG"] = "Attivare/disattivare il registro di debug"
L["SETTINGS_CMD_RESET"] = "Forzare il ripristino dei pulsanti di rilascio"

-- Portuguese (ptBR)
L = Locales.ptBR

L["SETTINGS_HEADER_GENERAL"] = "Configura\195\167\195\181es gerais"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Configurar como o addon previne a libera\195\167\195\163o de esp\195\173rito"
L["SETTINGS_HEADER_BLOCK"] = "Configura\195\167\195\181es de bloqueio"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Escolher quais bot\195\181es bloquear"
L["SETTINGS_HEADER_LOCATION"] = "Configura\195\167\195\181es de local"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Escolher onde o addon est\195\161 ativo"

L["SETTINGS_ENABLE_ADDON"] = "Ativar addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Ativar ou desativar toda a funcionalidade do addon"

L["SETTINGS_KEY_MODIFIER"] = "Tecla modificadora necessária"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Qual tecla deve ser mantida pressionada para liberar o espírito (ou Nenhuma apenas para temporizador)"
L["SETTINGS_KEY_NONE"] = "Nenhuma"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "SHIFT"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Temporizador de atraso (segundos)"
L["SETTINGS_TIMER_TOOLTIP"] = "Número de segundos de atraso antes de permitir a liberação (0 para desativar)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Tempo de segurança (segundos)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Sempre permitir a liberação após estes segundos, como rede de segurança em caso de erros do addon (0 para desativar)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Bloquear Pedra da Alma / Reencarnação"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Também bloquear os botões de Pedra da Alma e Reencarnação"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Ativar em mundo aberto"
L["SETTINGS_LOCATION_DELVES"] = "Ativar em Imersões"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Ativar em campos de batalha"
L["SETTINGS_LOCATION_DUNGEONS"] = "Ativar em masmorras"
L["SETTINGS_LOCATION_RAIDS"] = "Ativar em raides"

L["KEEP_HOLDING"] = "|cffffcc00Continue segurando %s|r"
L["DO_NOT_RELEASE"] = "|cffff0000NÃO LIBERAR|r"
L["HOLD_TO_RELEASE"] = "Segure %s para liberar"
L["WAIT_TO_RELEASE"] = "|cffffcc00Espere para liberar|r"
L["READY_IN"] = "Pronto em %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Comandos"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Comandos úteis para digitar no chat"
L["SETTINGS_CMD_OPEN"] = "Abrir este painel de configurações"
L["SETTINGS_CMD_DEBUG"] = "Alternar registro de depuração no chat"
L["SETTINGS_CMD_RESET"] = "Forçar restauração dos botões de liberação"

-- Russian (ruRU)
L = Locales.ruRU

L["SETTINGS_HEADER_GENERAL"] = "Общие настройки"
L["SETTINGS_HEADER_GENERAL_TOOLTIP"] = "Настройте, как аддон предотвращает освобождение духа"
L["SETTINGS_HEADER_BLOCK"] = "Настройки блокировки"
L["SETTINGS_HEADER_BLOCK_TOOLTIP"] = "Выберите, какие кнопки блокировать"
L["SETTINGS_HEADER_LOCATION"] = "Настройки местоположения"
L["SETTINGS_HEADER_LOCATION_TOOLTIP"] = "Выберите, где аддон активен"

L["SETTINGS_ENABLE_ADDON"] = "Включить аддон"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Включить или выключить все функции аддона"

L["SETTINGS_KEY_MODIFIER"] = "Требуемая клавиша-модификатор"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Какую клавишу нужно удерживать для освобождения духа (или Нет только для таймера)"
L["SETTINGS_KEY_NONE"] = "Нет"
L["SETTINGS_KEY_CTRL"] = "CTRL"
L["SETTINGS_KEY_SHIFT"] = "SHIFT"
L["SETTINGS_KEY_ALT"] = "ALT"

L["SETTINGS_TIMER"] = "Таймер задержки (секунды)"
L["SETTINGS_TIMER_TOOLTIP"] = "Количество секунд задержки перед разрешением освобождения (0 для отключения)"

L["SETTINGS_SAFETY_TIMEOUT"] = "Таймаут безопасности (секунды)"
L["SETTINGS_SAFETY_TIMEOUT_TOOLTIP"] = "Всегда разрешать освобождение после этого количества секунд, как подстраховка на случай ошибок аддона (0 для отключения)"

L["SETTINGS_BLOCK_SOULSTONE"] = "Блокировать Камень души / Перерождение"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Также блокировать кнопки Камня души и Перерождения"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Включить в открытом мире"
L["SETTINGS_LOCATION_DELVES"] = "Включить в Вылазках"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Включить на полях боя"
L["SETTINGS_LOCATION_DUNGEONS"] = "Включить в подземельях"
L["SETTINGS_LOCATION_RAIDS"] = "Включить в рейдах"

L["KEEP_HOLDING"] = "|cffffcc00Продолжайте удерживать %s|r"
L["DO_NOT_RELEASE"] = "|cffff0000НЕ ОСВОБОЖДАТЬ|r"
L["HOLD_TO_RELEASE"] = "Удерживайте %s для освобождения"
L["WAIT_TO_RELEASE"] = "|cffffcc00Ждите для освобождения|r"
L["READY_IN"] = "Готово через %.1fs"

L["SETTINGS_HEADER_COMMANDS"] = "Команды чата"
L["SETTINGS_HEADER_COMMANDS_TOOLTIP"] = "Полезные команды для чата"
L["SETTINGS_CMD_OPEN"] = "Открыть панель настроек"
L["SETTINGS_CMD_DEBUG"] = "Включить/выключить отладку в чате"
L["SETTINGS_CMD_RESET"] = "Принудительно восстановить кнопки освобождения"
