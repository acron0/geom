(require 'ox)
(let (base-dir pub-dir)
  (setq base-dir (file-name-directory (buffer-file-name)))
  (setq pub-dir (format "%shtml/" base-dir))
  (setq org-publish-project-alist
        (list
         (list "geom-main"
               :base-directory base-dir
               :base-extension "org"
               :publishing-directory pub-dir
               :recursive 'f
               :publishing-function 'org-html-publish-to-html
               :headline-levels 4
               :auto-preamble 'f)
         (list "geom-static"
               :base-directory (format "%sassets/" base-dir)
               :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
               :publishing-directory pub-dir
               :recursive 't
               :publishing-function 'org-publish-attachment)
         '("all" :components ("geom-main" "geom-static")))))

(org-babel-do-load-languages
     'org-babel-load-languages
     '((ditaa . t) (dot . t)))
