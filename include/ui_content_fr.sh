#!/bin/bash
# ============================================================================
#
# This is a component of the Spectrecoin shell rpc ui
#
# Author: 2018 HLXEasy
#
# ============================================================================

# ============================================================================
# Set global variables for text output(i.e. for main menu).
#
# Interpret embedded "\Z" sequences in the dialog text by the following character,
# which tells dialog to set colors or video attributes: 0 through 7 are the ANSI
# used in curses: black, red, green, yellow, blue, magenta, cyan and white respectively.
# Bold is set by 'b', reset by 'B'.
# Reverse is set by 'r', reset by 'R'.
# Underline is set by 'u', reset by 'U'.
# The settings are cumulative,
# e.g., "\Zb\Z1" makes the following text bold (perhaps bright) red.
# Restore normal settings with "\Zn".
TITLE_BACK=" Interface Portefeuille Spectrecoin Bash RPC (${VERSION}) "
TITLE_TRANS=" TRANSACTIONS RECENTES "
TITLE_INFO=""
TITLE_MENU=" ${TITLE_BACK} "
TITLE_GAUGE=" Veuillez patienter "
TITLE_ERROR=" ERREUR "
TITLE_SUCCESS=" Succès "
TITLE_STARTING_DAEMON=" Démarrage du Daemon "
TITLE_GOODBYE=" AU REVOIR "
TITLE_SEND=" Envoyer XSPEC "
TITLE_CONVERT=" Convertir jetons "
TITLE_USERCOMMAND=" Entrer la commande "
TITLE_CURL_RESULT=" Résultat cURL "
TITLE_RECEIVE=" Adresses Portefeuille "
TITLE_SUGGESTION=" Suggestion "
TITLE_PLACEHOLDER_FUNCTION=" SRY "
TITLE_ENCRYPT_WALLET=" Crypter le Portefeuille "
TITLE_VIEW_TRANSACTIONS=" Page "
TITLE_ADV_MENU=" Options avancées "
TITLE_WALLET_INFO=" Info Portefeuille "
TITLE_STAKING_INFO=" Staking Info "
TITLE_PLEASE_CHOOSE=" Veuillez choisir "
TITLE_UPDATE_BINARIES=" Mettre à jour Spectrecoin "
TITLE_LANGUAGE_SELECTION=" Langue actuelle: Français/French "
#
BUTTON_LABEL_ENCRYPT="Crypter"
BUTTON_LABEL_RESTART_DAEMON="Redémarrer le démon"
BUTTON_LABEL_ENTER="Entrée"
BUTTON_LABEL_OK="OK"
BUTTON_LABEL_LEAVE="Quitter"
BUTTON_LABEL_CONTINUE="Continuer"
BUTTON_LABEL_PREVIOUS="Précédent"
BUTTON_LABEL_NEXT="Suivant"
BUTTON_LABEL_SEND="Envoyer"
BUTTON_LABEL_EXECUTE="Exécuter"
BUTTON_LABEL_HELP="Aide"
BUTTON_LABEL_ADDRESS_BOOK="Carnet d'adresses"
BUTTON_LABEL_MAIN_MENU="Menu Principal"
BUTTON_LABEL_SHOW_STAKES="Montrer Stakes"
BUTTON_LABEL_HIDE_STAKES="Cacher Stakes"
BUTTON_LABEL_JUST_LEAVE="Non, seulement sortir de l'interface graphique"
BUTTON_LABEL_STOP_DAEMON="Oui, arrêter le démon"
BUTTON_LABEL_I_HAVE_UNDERSTOOD="OUI - j'ai compris"
BUTTON_LABEL_SHOW_BALANCE="Montrer le solde"
BUTTON_LABEL_HIDE_BALANCE="Cacher le solde"
BUTTON_LABEL_PUBLIC_TO_ANON="XSPEC vers SPECTRE"
BUTTON_LABEL_ANON_TO_PUBLIC="SPECTRE vers XSPEC"
#
# Main Menu
CMD_MAIN_LOCK_WALLET="Verrouiller"
EXPL_CMD_MAIN_WALLETLOCK="Verrouiller le portefeuille, arrêt du staking."
CMD_MAIN_UNLOCK_WALLET="Déverrouiller"
EXPL_CMD_MAIN_WALLETUNLOCK="Déverrouiller le portefeuille pour staking seulement."
CMD_MAIN_ENCRYPT_WALLET="Crypter"
EXPL_CMD_MAIN_WALLETENCRYPT="Crypter le portefeuille, améliore la sécurité."
CMD_MAIN_REFRESH="Mise à jour"
EXPL_CMD_MAIN_REFRESH="Actualiser l'interface."
CMD_MAIN_TRANS="Transactions"
EXPL_CMD_MAIN_VIEWTRANS="Voir toutes les transactions."
CMD_MAIN_SEND="Envoyer jetons"
EXPL_CMD_MAIN_SEND="Soit XSPEC ou SPECTRE."
CMD_MAIN_CONVERT_COINS="Convertir jetons"
EXPL_CMD_MAIN_CONVERT_COINS="XSPEC <-> SPECTRE."
CMD_MAIN_RECEIVE="Recevoir"
EXPL_CMD_MAIN_RECEIVE="Montrer adresses portefeuille."
CMD_MAIN_ADVANCED_MENU="Avancé"
EXPL_CMD_MAIN_ADVANCEDMENU="Options avancées."
CMD_MAIN_QUIT="Quitter"
EXPL_CMD_MAIN_EXIT="Quitter cette interface."
#
# Advanced Menu
CMD_USER_COMMAND="Commande"
EXPL_CMD_USER_COMMAND="Envoi des commandes au daemon."
CMD_CHANGE_WALLET_PW="Réencrypter"
EXPL_CMD_CHANGE_WALLET_PW="Changer le mot de passe du portefeuille."
CMD_STAKING_ANALYSE="Staking"
EXPL_CMD_STAKING_ANALYSE="Obtenir détails du staking."
CMD_GET_WALLET_INFO="Portefeuille"
EXPL_CMD_GET_WALLET_INFO="Obtenir les infos du portefeuille."
CMD_UPDATE="Mise à jour"
EXPL_CMD_UPDATE="Mie à jour des binaires Spectrecoin"
CMD_CHANGE_LANGUAGE="Langue"
EXPL_CMD_CHANGE_LANGUAGE="Changer la langue de cette interface graphique"
CMD_GET_PEER_INFO="Pairs"
EXPL_CMD_GET_PEER_INFO="Afficher les pairs actuels."
CMD_MAIN_MENU="Principal"
EXPL_CMD_MAIN_MENU="Retour au menu principal."
#
# Error Feedback
ERROR_MAINMENU_FATAL="Erreur fatale inattendue dans le dialogue menu principal."
ERROR_ADVMENU_FATAL="Erreur fatale inattendue  dans le dialogie menu Avancé."
ERROR_USERCOMMAND_FATAL="Erreur fatale inattendue dans le dialogue commande utilisateur."
ERROR_PW_FATAL="Erreur fatale inattendue dans le dialogue mot de passe."
ERROR_SEND_FATAL="Erreur fatale inattendue dans le dialogue envoyer."
ERROR_CONVERT_FATAL="Erreur fatale inattendue dans le dialogue conversion des jetons."
ERROR_TRANS_FATAL="Erreur fatale inattendue dans le dialogue voir toutes les transactions."
ERROR_GOODBYE_FATAL="Erreur fatale inattendue dans le dialogue arrêter daemon (au revoir)."
ERROR_SEND_INVALID_ADDRESS="\Z1Vous avez entré une adresse invalide.\Zn\n\nA Une adresse XSPEC valide doit être au format:\n- Commencer par \"S\"\n- Longueur 27-34\n- Majuscule \"O\", \"I\", Minuscule \"l\", et le nombre \"0\" ne sont jamais utilisés pour éciter toute ambiguité visuelle"
ERROR_SEND_INVALID_ANON_ADDRESS="\Z1Vous avez entré une adresse invalide.\Zn\n\nA Une adresse SPECTRE valide doit être au format:\n- Longueur 102 caractères\n- Majuscule \"O\", \"I\", Minuscule \"l\", et le nombre \"0\" ne sont jamais utilisés pour éciter toute ambiguité visuelle"
ERROR_SEND_INVALID_AMOUNT="Le montant doit etre un nombre, avec:\n- plus grand que 0\n- max. 8 décimales"
ERROR_CURL_MSG_PROMPT="Erreur message CURL:"
ERROR_401_UNAUTHORIZED="Erreur: RPC login en échec. Avez-vous changé le mot de passe dans redémarrer le démon? Note: Vous pouvez arrêter le démon avec la commande: wallet-stop"
ERROR_DAEMON_NO_CONNECT_FROM_REMOTE="Aucune connexion à sprectrecoind n'a pu être établie.\nVous devriez vérifier votre configuration."
ERROR_DAEMON_NO_CONNECT="Le daemon ne répond plus depuis 60 secondes.\nAucune connexion à sprectrecoind n'a pu être établie.\nVous devriez vérifier votre configuration."
#
# use \ for a new line - note: there will be no auto line breaking
ERROR_DAEMON_ALREADY_RUNNING="Spectrecoind (daemon) déjà en cours d'éxécution!\Mais aucune connexion n'a pu être établie.\Cela signifie que le démon vient de démarrer."
ERROR_DAEMON_STARTING="Spectrecoind arrêté.\Démarrage Spectrecoind (démon)..."
ERROR_DAEMON_WAITING_BEGIN="Le démon a besoin de temps pour s'initialiser.\Attendre 1 minute pour le démon..."
ERROR_DAEMON_WAITING_MSG="secondes restantes..."
ERROR_DAEMON_WAITING_MSG_SUCCESS="Démon connecté.\Tout va bien."
ERROR_DAEMON_WAITING_END="C'est fait. Démarrage de l'interface..."
#
TEXT_HEADLINE_WALLET_INFO="Info Portefeuille"
TEXT_BALANCE="Solde"
TEXT_CURRENCY="XSPEC"
TEXT_CURRENCY_ANON="SPECTRE"
TEXT_WALLET_STATE="Portefeuille"
TEXT_WALLET_HAS_NO_PW="\Z1aucun PW\Zn"
TEXT_WALLET_IS_UNLOCKED="\Z4déverrouillé\Zn"
TEXT_WALLET_IS_LOCKED="\Z1vérrouillé\Zn"
#
TEXT_HEADLINE_CLIENT_INFO="Client info"
TEXT_DAEMON_VERSION="Démon"
TEXT_DAEMON_ERRORS_DURING_RUNTIME="Erreurs"
TEXT_DAEMON_NO_ERRORS_DURING_RUNTIME="aucune"
TEXT_DAEMON_IP="IP"
TEXT_DAEMON_PEERS="Pairs"
TEXT_DAEMON_DOWNLOADED_DATA="Téléchargé"
TEXT_DAEMON_UPLOADED_DATA="Envoyé"
#
TEXT_HEADLINE_STAKING_INFO="Staking Info"
TEXT_STAKING_STATE="Staking"
TEXT_STAKING_ON="\Z4ON\Zn"
TEXT_STAKING_OFF="\Z1OFF\Zn"
TEXT_STAKING_COINS="Jetons"
TEXT_MATURING_COINS="d'âge"
TEXT_EXP_TIME="Temps estimé"
TEXT_STAKING_AVAILABLE="Disponible"
TEXT_STAKING_STAKED="Staked"
#
TEXT_STAKE="\Z4STAKE\Zn"
TEXT_IMMATURE="\Z5IMMATURE\Zn"
TEXT_RECEIVED="\Z2RECUS\Zn"
TEXT_TRANSFERRED="\Z1ENVOYES\Zn"
TEXT_CONTRIBUTE="\Z6CONTRIBUTION\Zn"
TEXT_CONFIRMATIONS="Confirmations"
TEXT_ADDRESS="Adresse"
TEXT_TXID="TxID"
TEXT_NARRATION="Narration"
TEXT_FEE="Commission"
#
TEXT_CLIPBOARD_HINT="Sur Linux: Utiliser \Z6[CTRL]\Zn + \Z6[SHIFT]\Zn + \Z6[V]\Zn pour coller depuis le presse-papiers."
TEXT_SEND_DESTINATION_ADDRESS_EXPL="Adresse de destination"
TEXT_SEND_DESTINATION_ADDRESS="Adresse"
TEXT_SEND_AMOUNT_EXPL="Montant de"
TEXT_SEND_AMOUNT="Montant"
TEXT_SEND_EXPL="Entrer l'adresse de destination."
TEXT_SEND_NARRATION="Narration"
#
TEXT_PW_EXPL="Entrer le mot de passe du portefeuille"
TEXT_CURRENT_PW_EXPL="Entrer le mot de passe actuel du portefeuille"
TEXT_NEW_PW1_EXPL="Entrer le nouveau mot de passe"
TEXT_NEW_PW2_EXPL="Entrer à nouveau le mot de passe"
TEXT_NO_PASS_GIVEN="Aucun mot de passe fourni"
TEXT_NO_NEW_PASS_GIVEN="Aucun nouveau mot de passe fourni"
TEXT_NEW_PASS_NOT_EQUAL="Les nouveaux mots de passe ne correspondent pas"
TEXT_PASS_CHANGE_SUCCESSFUL="Changement de Phrase secrète correctement exécuté"
TEXT_WALLET_ENCRYPTION_SUCCESSFUL="Portefeuille encrypté avec succès. Redémarrage du démon..."
#
TEXT_USERCOMMAND_EXPL="Vous pouvez saisir ici les commmandes qui seront envoyées au démon."
TEXT_USERCOMMAND_CMD_EXPL="saisir help pour plus d'infos"
TEXT_USERCOMMAND_CMD="Commande"
TEXT_USERCOMMAND_PARAMS_EXPL="séparée par des espaces"
TEXT_USERCOMMAND_PARAMS="Paramètre"
#
TEXT_GAUGE_ALLDONE="C'est fait."
TEXT_GAUGE_DEFAULT="Obtention des données du démon..."
TEXT_GAUGE_GET_INFO="Obtention des données générales du démon..."
TEXT_GAUGE_PROCESS_INFO="Traitement des infos générales..."
TEXT_GAUGE_GET_STAKING_DATA="Obtention des données de staking du démon..."
TEXT_GAUGE_PROCESS_STAKING_DATA="Traitement des données de staking..."
TEXT_GAUGE_GET_TRANS="Obtention des données de transaction du démon..."
TEXT_GAUGE_PROCESS_TRANS="Traitement des données de transaction...."
#
TEXT_GOODBYE_WARNING="\Z1Si vous prévoyez d'éteindre le système, le démon doit être arrêté d'abord pour éviter toute corruption de données!\Zn\n\nVoulez-vous arrêter le démon (fin du staking) ou seulement quitter l'UI?\Zn"
TEXT_GOODBYE_DAEMON_STILL_RUNNING="Le démon est toujours en cours d'éxécution."
TEXT_GOODBYE_DAEMON_STOPPED="Démon arrêté."
TEXT_GOODBYE_FEEDBACK="Les remarques sont les bienvenues, merci d'avance!"
#
TEXT_FEEDBACK_WALLET_LOCKED="Portefeuille correctement verrouillé.\n\n\Z5Vous ne serez plus en mesure de staker.\Zn\n\nUtilisez \Z4${CMD_MAIN_UNLOCK_WALLET}\Zn dans le menu principal pour déverrouiler le portefeuille pour seulement staker à nouveau."
TEXT_FEEDBACK_WALLET_UNLOCKED="Portefeuille correctement déverrouillé."
TEXT_SUGGESTION_STAKING="Cela prendra un petit moment au démon pour mettre à jour le statut du staking, après que le portefeuille soit verrouillé/déverrouillé.\nUtiliser la \Z4${CMD_MAIN_REFRESH}\Zn commande dans le menu principal pour rafraichir l'écran."
TEXT_FEEDBACK_RECEIVE="Appuyez sur retour pour continuer vers le menu principal."
TEXT_DEFAULT_ADDRESS="Adresse XSPEC par défaut"
TEXT_DEFAULT_STEALTH_ADDRESS="Adresse SPECTRE par défaut"
#
TEXT_SEND_UNLOCK_WALLET_AGAIN="Notice\nVeuillez noter:\nVous devez 'déverrouiller' le portefeuille pour staker à nouveau.\n"
TEXT_SUGGESTION_TO_INCREASE_TERMINAL_SIZE="\nAugmenter la taille du terminal à au moins"
TEXT_PLACEHOLDER_FUNCTION="\nEn travaux...\n\nDésolé, pour l'instant cet espace est réservé."
#
TEXT_ESTIMATIONS="Estimations"
TEXT_ONE_MONTH="un mois"
TEXT_HALF_YEAR="6 mois"
TEXT_ONE_YEAR="un an"
TEXT_TWO_YEARS="deux ans"
TEXT_THREE_YEARS="trois ans"
TEXT_FOUR_YEARS="quatre ans"
TEXT_FIVE_YEARS="cinq ans"
TEXT_STAKING_ANALYSIS_TIMEFRAME="Estimation de la durée"
TEXT_STAKING_ANALYSIS_LAST_THOUSAND="Parmi les 1000 dernières transactions"
TEXT_STAKING_ANALYSIS_AMOUNTS="Staking transactions"
TEXT_STAKING_ANALYSIS_TOTAL_REWARD="Récompense totale"
TEXT_STAKING_ANALYSIS_TOTAL_TODAY="Jetons au total"
TEXT_STAKING_ANALYSIS_REWARD_PER_YEAR="- Taux de récompense de Staking par an"
TEXT_STAKING_ANALYSIS_COINS_IN_ONE_MONTH="- Jetons au total en un mois"
TEXT_STAKING_ANALYSIS_STAKED_COINS_IN="- Jetons stakés en"
TEXT_STAKING_ANALYSIS_TOTAL_COINS_IN="- Jetons totaux en"
#
TEXT_COIN_TYPE_TO_SEND_QUESTION="\nQuel type de jeton voulez-vous envoyer?"
TEXT_CONVERSION_QUESTION="\nDans quelle direction voulez-vous convertir?"
TEXT_AMOUNT_TO_CONVERT="Montant à convertir"
#
TEXT_QUESTION_DO_UPDATE="Mettre à jour les binaires Spectrecoin?\nLe démon Spectrecoin sera arrêté!\n"
TEXT_UPDATE_CANCELED="Mise à jour annulée"
#
TEXT_CHOOSE_LANGUAGE="Choisir une langue"
TEXT_CHOOSE_LANGUAGE_CANCELED="Changement de langue annulé"
#
TEXT_USE_AT_YOUR_OWN_RISC="                  Utilisez à vos risques et périls!!!\n\n"
