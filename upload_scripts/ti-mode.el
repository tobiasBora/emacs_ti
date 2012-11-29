;; Ce code sert à envoyer le fichier courant ou
;; le fichier principal appelé via :
;; --Ti-mode-file="<nom fichier>"

(setq leo-ti-path-upload "~/bin/script_upload.lua")

(defun ti-mode-search-main-file ()
  (interactive)
  (setq L_TI_action (leo-extract-regexp buffer-file-name "--Ti-mode-file=\"\\(.*\\)\""))
  ;; (print L_TI_action)
  (if (not L_TI_action)
              (setq L_TI_action buffer-file-name))
  (async-shell-command (concat leo-ti-path-upload L_TI_action)  "Ti send")

  )

(defun leo-extract-regexp(path-file regexp)
  "Ex: (leo-extract-regexp buffer-file-name '--Ti-mode-file='\\(.*\\))''"
  (interactive)
  (message path-file)
  (with-current-buffer
			(find-file-noselect path-file)
		      (save-excursion
			(goto-char 1)
			(if (re-search-forward regexp nil t 1)
			    (match-string-no-properties 1)
			  (setq bidon nil))))
  )


;; ############ Version ok mais pas très propre #################
;; (defun ti-mode-search-main-file ()
;;   (interactive)
;;   (setq L_A_action (with-current-buffer
;; 			(find-file-noselect buffer-file-name)
;; 		      (save-excursion
;; 			(goto-char 1)
;; 			(if (re-search-forward "--Ti-mode-file=\"\\(.*\\)\"" nil t 1)
;; 			    (match-string-no-properties 1)
;; 			  (setq bidon nil)))))
;;   ;; (setq L_A_action (leo-extract-regexp buffer-file-name "--Ti-mode-file=\"\\(.*\\)\""))
;;   (print L_A_action)
;;   ;; (async-shell-command (concat leo-path-ti-upload )  "ANDROID COMMANDE")

;; )

;; ############ Version avec erreur en cas de non présence: ###############
;; (defun ti-mode-search-main-file ()
;;   (interactive)
;;   (setq L_A_action (with-current-buffer
;; 			(find-file-noselect buffer-file-name)
;; 		      (save-excursion
;; 			(goto-char 1)
;; 			(if (re-search-forward "--Ti-mode-file=\"\\(.*\\)\"" nil t 1)
;; 			    (match-string-no-properties 1)
;; 			  (error "Search failed")))))
;;   ;; (setq L_A_action (leo-extract-regexp buffer-file-name "--Ti-mode-file=\"\\(.*\\)\""))
;;   (message L_A_action)
;;   ;; (async-shell-command (concat leo-path-ti-upload )  "ANDROID COMMANDE")

;;   )
