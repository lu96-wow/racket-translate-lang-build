;; setup/setup
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'setup  (cons #f (hash '#:avoid-main? #f '#:check-pkg-deps? #f '#:clean? #f '#:collections #f '#:fail-fast? #f '#:file #f '#:fix-pkg-deps? #f '#:force-user-docs? #f '#:get-target-dir #f '#:jobs #f '#:make-doc-index? #f '#:make-docs? #f '#:make-user? #f '#:pkgs #f '#:planet-specs #f '#:recompile-cache #f '#:recompile-only? #f '#:tidy? #f '#:unused-pkg-deps? #f))
))
