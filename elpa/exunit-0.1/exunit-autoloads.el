;;; exunit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "exunit" "exunit.el" (0 0 0 0))
;;; Generated autoloads from exunit.el

(autoload 'exunit-mode "exunit" "\
Minor mode for ExUnit test runner

\(fn &optional ARG)" t nil)

(autoload 'exunit-rerun "exunit" "\
Re-run the last test invocation.

\(fn)" t nil)

(autoload 'exunit-verify-all "exunit" "\
Run all the tests in the current project.

\(fn)" t nil)

(autoload 'exunit-verify-all-in-umbrella "exunit" "\
Run all the tests in the current umbrella project.

\(fn)" t nil)

(autoload 'exunit-verify-single "exunit" "\
Run the test under the point.

\(fn)" t nil)

(autoload 'exunit-verify "exunit" "\
Run all the tests associated with the current buffer.

\(fn)" t nil)

(autoload 'exunit-toggle-file-and-test "exunit" "\
Toggle between a file and its tests in the current window.

\(fn)" t nil)

(autoload 'exunit-toggle-file-and-test-other-window "exunit" "\
Toggle between a file and its tests in other window.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exunit" '("exunit-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; exunit-autoloads.el ends here
