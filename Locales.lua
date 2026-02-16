local Locales = {
    enUS = {},
    frFR = {},
    deDE = {},
    ruRU = {},
    ptBR = {},
    esES = {},
    esMX = {},
    zhTW = {},
    zhCN = {},
    koKR = {},
    itIT = {},
}

STAYDEAD_LOCALES = Locales

-- English (default)
local L = Locales.enUS

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

L["SETTINGS_BLOCK_SOULSTONE"] = "Block Soulstone / Reincarnation"
L["SETTINGS_BLOCK_SOULSTONE_TOOLTIP"] = "Also block the Soulstone and Reincarnation buttons"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Enable in Open World"
L["SETTINGS_LOCATION_DELVES"] = "Enable in Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Enable in Battlegrounds"
L["SETTINGS_LOCATION_DUNGEONS"] = "Enable in Dungeons"
L["SETTINGS_LOCATION_RAIDS"] = "Enable in Raids"

L["KEEP_HOLDING"] = "|cffffcc00Keep holding %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000DO NOT RELEASE|r"
L["HOLD_TO_RELEASE"] = "Hold %s to Release"
L["WAIT_TO_RELEASE"] = "|cffffcc00Wait to release|r"
L["READY_IN"] = "Ready in %.1fs"

-- German (deDE)
L = Locales.deDE

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

L["SETTINGS_LOCATION_OPEN_WORLD"] = "In offener Welt aktivieren"
L["SETTINGS_LOCATION_DELVES"] = "In Delves aktivieren"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "In Schlachtfeldern aktivieren"
L["SETTINGS_LOCATION_DUNGEONS"] = "In Dungeons aktivieren"
L["SETTINGS_LOCATION_RAIDS"] = "In Raids aktivieren"

L["KEEP_HOLDING"] = "|cffffcc00Halte %s weiterhin gedrückt|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000NICHT FREIGEBEN|r"
L["HOLD_TO_RELEASE"] = "%s halten zum Freigeben"
L["WAIT_TO_RELEASE"] = "|cffffcc00Warten zum Freigeben|r"
L["READY_IN"] = "Bereit in %.1fs"

-- French (frFR)
L = Locales.frFR

L["SETTINGS_ENABLE_ADDON"] = "Activer l'addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Activer ou désactiver toutes les fonctionnalités de l'addon"

L["SETTINGS_KEY_MODIFIER"] = "Touche modificatrice requise"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Quelle touche doit être maintenue pour libérer l'esprit (ou Aucune pour le minuteur uniquement)"
L["SETTINGS_KEY_NONE"] = "Aucune"
L["SETTINGS_KEY_SHIFT"] = "MAJ"

L["SETTINGS_TIMER"] = "Minuteur de délai (secondes)"
L["SETTINGS_TIMER_TOOLTIP"] = "Nombre de secondes de délai avant d'autoriser la libération (0 pour désactiver)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Activer en monde ouvert"
L["SETTINGS_LOCATION_DELVES"] = "Activer dans les Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Activer dans les champs de bataille"
L["SETTINGS_LOCATION_DUNGEONS"] = "Activer dans les donjons"
L["SETTINGS_LOCATION_RAIDS"] = "Activer dans les raids"

L["KEEP_HOLDING"] = "|cffffcc00Maintenez %s enfoncé|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000NE PAS LIBÉRER|r"
L["HOLD_TO_RELEASE"] = "Maintenez %s pour libérer"
L["WAIT_TO_RELEASE"] = "|cffffcc00Attendez pour libérer|r"
L["READY_IN"] = "Prêt dans %.1fs"

-- Spanish (esES/esMX)
L = Locales.esES

L["SETTINGS_ENABLE_ADDON"] = "Activar addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Activar o desactivar toda la funcionalidad del addon"

L["SETTINGS_KEY_MODIFIER"] = "Tecla modificadora requerida"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Qué tecla debe mantenerse presionada para liberar el espíritu (o Ninguna solo para temporizador)"
L["SETTINGS_KEY_NONE"] = "Ninguna"
L["SETTINGS_KEY_SHIFT"] = "MAYÚS"

L["SETTINGS_TIMER"] = "Temporizador de retraso (segundos)"
L["SETTINGS_TIMER_TOOLTIP"] = "Número de segundos de retraso antes de permitir la liberación (0 para desactivar)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Activar en mundo abierto"
L["SETTINGS_LOCATION_DELVES"] = "Activar en Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Activar en campos de batalla"
L["SETTINGS_LOCATION_DUNGEONS"] = "Activar en mazmorras"
L["SETTINGS_LOCATION_RAIDS"] = "Activar en bandas"

L["KEEP_HOLDING"] = "|cffffcc00Sigue manteniendo %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000NO LIBERAR|r"
L["HOLD_TO_RELEASE"] = "Mantén %s para liberar"
L["WAIT_TO_RELEASE"] = "|cffffcc00Espera para liberar|r"
L["READY_IN"] = "Listo en %.1fs"

-- Italian (itIT)
L = Locales.itIT

L["SETTINGS_ENABLE_ADDON"] = "Attiva addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Attiva o disattiva tutte le funzionalità dell'addon"

L["SETTINGS_KEY_MODIFIER"] = "Tasto modificatore richiesto"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Quale tasto deve essere tenuto premuto per rilasciare lo spirito (o Nessuno solo per timer)"
L["SETTINGS_KEY_NONE"] = "Nessuno"
L["SETTINGS_KEY_SHIFT"] = "MAIUSC"

L["SETTINGS_TIMER"] = "Timer di ritardo (secondi)"
L["SETTINGS_TIMER_TOOLTIP"] = "Numero di secondi di ritardo prima di consentire il rilascio (0 per disattivare)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Attiva nel mondo aperto"
L["SETTINGS_LOCATION_DELVES"] = "Attiva nei Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Attiva nei campi di battaglia"
L["SETTINGS_LOCATION_DUNGEONS"] = "Attiva in dungeon"
L["SETTINGS_LOCATION_RAIDS"] = "Attiva nelle incursioni"

L["KEEP_HOLDING"] = "|cffffcc00Continua a tenere premuto %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000NON RILASCIARE|r"
L["HOLD_TO_RELEASE"] = "Tieni premuto %s per rilasciare"
L["WAIT_TO_RELEASE"] = "|cffffcc00Attendi per rilasciare|r"
L["READY_IN"] = "Pronto tra %.1fs"

-- Portuguese (ptBR)
L = Locales.ptBR

L["SETTINGS_ENABLE_ADDON"] = "Ativar addon"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Ativar ou desativar toda a funcionalidade do addon"

L["SETTINGS_KEY_MODIFIER"] = "Tecla modificadora necessária"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Qual tecla deve ser mantida pressionada para liberar o espírito (ou Nenhuma apenas para temporizador)"
L["SETTINGS_KEY_NONE"] = "Nenhuma"

L["SETTINGS_TIMER"] = "Temporizador de atraso (segundos)"
L["SETTINGS_TIMER_TOOLTIP"] = "Número de segundos de atraso antes de permitir a liberação (0 para desativar)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Ativar em mundo aberto"
L["SETTINGS_LOCATION_DELVES"] = "Ativar em Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Ativar em campos de batalha"
L["SETTINGS_LOCATION_DUNGEONS"] = "Ativar em masmorras"
L["SETTINGS_LOCATION_RAIDS"] = "Ativar em raides"

L["KEEP_HOLDING"] = "|cffffcc00Continue segurando %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000NÃO LIBERAR|r"
L["HOLD_TO_RELEASE"] = "Segure %s para liberar"
L["WAIT_TO_RELEASE"] = "|cffffcc00Espere para liberar|r"
L["READY_IN"] = "Pronto em %.1fs"

-- Russian (ruRU)
L = Locales.ruRU

L["SETTINGS_ENABLE_ADDON"] = "Включить аддон"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "Включить или выключить все функции аддона"

L["SETTINGS_KEY_MODIFIER"] = "Требуемая клавиша-модификатор"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "Какую клавишу нужно удерживать для освобождения духа (или Нет только для таймера)"
L["SETTINGS_KEY_NONE"] = "Нет"

L["SETTINGS_TIMER"] = "Таймер задержки (секунды)"
L["SETTINGS_TIMER_TOOLTIP"] = "Количество секунд задержки перед разрешением освобождения (0 для отключения)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "Включить в открытом мире"
L["SETTINGS_LOCATION_DELVES"] = "Включить в Delves"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "Включить на полях боя"
L["SETTINGS_LOCATION_DUNGEONS"] = "Включить в подземельях"
L["SETTINGS_LOCATION_RAIDS"] = "Включить в рейдах"

L["KEEP_HOLDING"] = "|cffffcc00Продолжайте удерживать %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000НЕ ОСВОБОЖДАТЬ|r"
L["HOLD_TO_RELEASE"] = "Удерживайте %s для освобождения"
L["WAIT_TO_RELEASE"] = "|cffffcc00Ждите для освобождения|r"
L["READY_IN"] = "Готово через %.1fs"

-- Korean (koKR)
L = Locales.koKR

L["SETTINGS_ENABLE_ADDON"] = "애드온 활성화"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "모든 애드온 기능 활성화 또는 비활성화"

L["SETTINGS_KEY_MODIFIER"] = "필수 수정 키"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "영혼을 해방하기 위해 눌러야 하는 키 (또는 타이머만 사용하려면 없음)"
L["SETTINGS_KEY_NONE"] = "없음"

L["SETTINGS_TIMER"] = "지연 타이머 (초)"
L["SETTINGS_TIMER_TOOLTIP"] = "해방을 허용하기 전 지연 시간(초) (0 为停用)"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "야외에서 활성화"
L["SETTINGS_LOCATION_DELVES"] = "Delves에서 활성화"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "전장에서 활성화"
L["SETTINGS_LOCATION_DUNGEONS"] = "던전에서 활성화"
L["SETTINGS_LOCATION_RAIDS"] = "공격대에서 활성화"

L["KEEP_HOLDING"] = "|cffffcc00%s를 계속 누르세요|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000해방하지 마세요|r"
L["HOLD_TO_RELEASE"] = "%s를 눌러 해방"
L["WAIT_TO_RELEASE"] = "|cffffcc00해방을 기다리세요|r"
L["READY_IN"] = "%.1fs 후 준비됨"

-- Chinese Simplified (zhCN)
L = Locales.zhCN

L["SETTINGS_ENABLE_ADDON"] = "启用插件"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "启用或禁用所有插件功能"

L["SETTINGS_KEY_MODIFIER"] = "需要的修饰键"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "释放灵魂时必须按住的键（或仅计时器则选择无）"
L["SETTINGS_KEY_NONE"] = "无"

L["SETTINGS_TIMER"] = "延迟计时器（秒）"
L["SETTINGS_TIMER_TOOLTIP"] = "允许释放前的延迟秒数（0 为禁用）"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "在开放世界中启用"
L["SETTINGS_LOCATION_DELVES"] = "在地下城中启用"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "在战场中启用"
L["SETTINGS_LOCATION_DUNGEONS"] = "在副本中启用"
L["SETTINGS_LOCATION_RAIDS"] = "在团队副本中启用"

L["KEEP_HOLDING"] = "|cffffcc00请继续按住 %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000请勿释放|r"
L["HOLD_TO_RELEASE"] = "按住 %s 以释放"
L["WAIT_TO_RELEASE"] = "|cffffcc00请等待释放|r"
L["READY_IN"] = "%.1fs 后可用"

-- Chinese Traditional (zhTW)
L = Locales.zhTW

L["SETTINGS_ENABLE_ADDON"] = "啟用插件"
L["SETTINGS_ENABLE_ADDON_TOOLTIP"] = "啟用或停用所有插件功能"

L["SETTINGS_KEY_MODIFIER"] = "需要的修飾鍵"
L["SETTINGS_KEY_MODIFIER_TOOLTIP"] = "釋放靈魂時必須按住的鍵（或僅計時器則選擇無）"
L["SETTINGS_KEY_NONE"] = "無"

L["SETTINGS_TIMER"] = "延遲計時器（秒）"
L["SETTINGS_TIMER_TOOLTIP"] = "允許釋放前的延遲秒數（0 為停用）"

L["SETTINGS_LOCATION_OPEN_WORLD"] = "在開放世界中啟用"
L["SETTINGS_LOCATION_DELVES"] = "在地下城中啟用"
L["SETTINGS_LOCATION_BATTLEGROUNDS"] = "在戰場中啟用"
L["SETTINGS_LOCATION_DUNGEONS"] = "在副本中啟用"
L["SETTINGS_LOCATION_RAIDS"] = "在團隊副本中啟用"

L["KEEP_HOLDING"] = "|cffffcc00請繼續按住 %s|r\n(%.1fs)"
L["DO_NOT_RELEASE"] = "|cffff0000請勿釋放|r"
L["HOLD_TO_RELEASE"] = "按住 %s 以釋放"
L["WAIT_TO_RELEASE"] = "|cffffcc00請等待釋放|r"
L["READY_IN"] = "%.1fs 後可用"
