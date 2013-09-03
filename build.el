(require 'org-publish)

(setq org-publish-project-alist
     '(("veep"
        :base-directory "~/Google Drive/veep/org"
        :base-extension "org"
        :publishing-directory "~/Google Drive/veep/site"
        :recursive t
        :section-numbers nil
        :with-toc nil
        :author "Howard Abrams"
        :email "howard.abrams@gmail.com"
        :html-preamble nil
        :html-postamble nil
        :html-head "
                 <link href='styles/ui-darkness/jquery-ui.css' rel='Stylesheet'/>
                 <script src='scripts/lib/underscore-min.js' type='text/javascript'></script>
                 <script src='scripts/lib/jquery-1.9.1.js' type='text/javascript'></script>
                 <script src='scripts/lib/jquery-ui.js'></script>
                 <script src='scripts/lib/pen_min.js'></script>
                 <script src='scripts/lib/coffee-script.js' type='text/javascript' charset='utf-8'></script>
                 <link href='styles/main.css' type='text/css' rel='Stylesheet' />
                 <link href='styles/console.css' type='text/css' rel='Stylesheet' />               
                 <script src='scripts/main.coffee' type='text/coffeescript'></script>
                 <script src='scripts/console.coffee' type='text/coffeescript'></script>
                 <script src='scripts/veeps-rv-1.coffee' type='text/coffeescript'></script>"

        ;; If publishing from an older version of org-mode (notably
        ;; from the command line), use the following line:
        ;;; :publishing-function org-publish-org-to-html

        ;; If publishing from a new version of org-mode:
        :publishing-function org-html-publish-to-html)))

       ;; ("veep-styles"
       ;;  :base-directory "styles"
       ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|deb"
       ;;  :publishing-directory "site/styles"
       ;;  :recursive t
       ;;  :publishing-function org-publish-attachment)
       ;; ("veep-scripts"
       ;;  :base-directory "scripts"
       ;;  :base-extension "coffee\\|js"
       ;;  :publishing-directory "site/scripts"
       ;;  :recursive t
       ;;  :publishing-function org-publish-attachment)
       ;; ("veep-images"
       ;;  :base-directory "images"
       ;;  :base-extension "png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|deb"
       ;;  :publishing-directory "site/images"
       ;;  :recursive t
       ;;  :publishing-function org-publish-attachment)))

(defun babel-a-file (file)
   "Read the contents of a babel file into a temp buffer and then tangle it."
   (when (file-readable-p file)
     (with-temp-buffer
       (insert-file-contents file)
       (message "Working on %s" file)
       (org-babel-tangle))))

(defun babel-all-files (files)
  (when (consp files)
    (progn
      (babel-a-file (car files))
      (babel-all-files (cdr files)))))

(babel-all-files (directory-files "~/Google Drive/veep/source" t ".*\.org"))

(org-publish-all)
