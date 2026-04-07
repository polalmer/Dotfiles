(deftheme midnight-x
  "Converted from JASSPA MicroEmacs Midnight X")

(let ((bg        "#000000")
      (bg-alt    "#1e1e1e")
      (fg        "#d2d2d2")
      (fg-bright "#e6e6e6")

      (yellow    "#facd28")
      (blue      "#6495ed")
      (green     "#8bf59f")
      (cyan      "#87cefa")
      (purple    "#9092ff")
      (teal      "#91b6c7")
      (gold      "#f0e68c")
      (orange    "#ffa500")
      (gray      "#949494")
      (magenta   "#f0a0f0")
      (red-soft  "#ff827f")
      (red       "#ff8282"))

  (custom-theme-set-faces
   'midnight-x

   ;; Basic UI
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,blue))))
   `(region ((t (:background ,bg-alt))))
   `(highlight ((t (:background ,bg-alt))))
   `(fringe ((t (:background ,bg))))

   ;; Mode line
   `(mode-line ((t (:background ,fg :foreground ,bg))))
   `(mode-line-inactive ((t (:background ,bg-alt :foreground ,fg))))

   ;; Font lock (syntax highlighting)
   `(font-lock-keyword-face ((t (:foreground ,cyan :weight bold))))
   `(font-lock-function-name-face ((t (:foreground ,green))))
   `(font-lock-variable-name-face ((t (:foreground ,gold))))
   `(font-lock-type-face ((t (:foreground ,purple))))
   `(font-lock-constant-face ((t (:foreground ,orange))))
   `(font-lock-string-face ((t (:foreground ,magenta))))
   `(font-lock-comment-face ((t (:foreground ,gray :slant italic))))
   `(font-lock-builtin-face ((t (:foreground ,blue))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))

   ;; Links / markup
   `(link ((t (:foreground ,blue :underline t))))
   `(shadow ((t (:foreground ,gray))))

   ;; Minibuffer
   `(minibuffer-prompt ((t (:foreground ,cyan :weight bold))))

   ;; Errors
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,orange))))
   `(success ((t (:foreground ,green))))
))

(provide-theme 'midnight-x)
