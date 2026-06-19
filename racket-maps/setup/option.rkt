;; setup/option
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/45 translated)
(define plain-map (hash
  'always-check-dependencies  #f
  'archive-implies-reindex  #f
  'archives  #f
  'avoid-main-installation  #f
  'call-install  #f
  'call-post-install  #f
  'call-with-flag-params  #f
  'check-dependencies  #f
  'check-unused-dependencies  #f
  'clean  #f
  'compile-mode  #f
  'compiler-verbose  #f
  'current-target-directory-getter  #f
  'current-target-plt-directory-getter  #f
  'doc-pdf-dest  #f
  'fail-fast  #f
  'fix-dependencies  #f
  'force-unpacks  #f
  'force-user-docs  #f
  'make-doc-index  #f
  'make-docs  #f
  'make-foreign-libs  #f
  'make-info-domain  #f
  'make-launchers  #f
  'make-only  #f
  'make-planet  #f
  'make-tidy  #f
  'make-user  #f
  'make-verbose  #f
  'make-zo  #f
  'next-error-out-file  #f
  'parallel-use-places  #f
  'parallel-workers  #f
  'pause-on-errors  #f
  'previous-error-in-file  #f
  'recompile-cache  #f
  'recompile-only  #f
  'set-flag-params  #f
  'setup-compiled-file-paths  #f
  'setup-program-name  #f
  'specific-collections  #f
  'specific-packages  #f
  'specific-planet-dirs  #f
  'sync-docs-only  #f
  'verbose  "详细"
))

