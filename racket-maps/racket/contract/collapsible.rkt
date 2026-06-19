;; racket/contract/collapsible
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/41 translated)
(define plain-map (hash
  'build-collapsible-leaf  #f
  'collapsible-contract-continuation-mark-key  #f
  'collapsible-contract-property?  #f
  'collapsible-contract?  #f
  'collapsible-count-property  #f
  'collapsible-count-property-count  #f
  'collapsible-count-property-prev  #f
  'collapsible-count-property?  #f
  'collapsible-guard  #f
  'collapsible-ho/c  #f
  'collapsible-ho/c-latest-blame  #f
  'collapsible-ho/c-latest-ctc  #f
  'collapsible-ho/c-missing-party  #f
  'collapsible-ho/c?  #f
  'collapsible-leaf/c  #f
  'collapsible-leaf/c-blame-list  #f
  'collapsible-leaf/c-contract-list  #f
  'collapsible-leaf/c-missing-party-list  #f
  'collapsible-leaf/c-proj-list  #f
  'collapsible-leaf/c?  #f
  'collapsible-property  #f
  'collapsible-property-c-c  #f
  'collapsible-property-neg-party  #f
  'collapsible-property-ref  #f
  'collapsible-property?  #f
  'collapsible-wrapper-property  #f
  'collapsible-wrapper-property-checking-wrapper  #f
  'collapsible-wrapper-property?  #f
  'get-impersonator-prop:collapsible  #f
  'get/build-collapsible-late-neg-projection  #f
  'has-impersonator-prop:collapsible?  #f
  'impersonator-prop:collapsible  #f
  'merge  #f
  'prop:collapsible-contract  #f
  'set-collapsible-property-ref!  #f
  'struct:collapsible-count-property  #f
  'struct:collapsible-ho/c  #f
  'struct:collapsible-leaf/c  #f
  'struct:collapsible-property  #f
  'struct:collapsible-wrapper-property  #f
  'with-collapsible-contract-continuation-mark  #f
))

;; with-kw (1)
(define kw-map (hash
  'build-collapsible-contract-property  (cons #f (hash '#:collapsible-guard #f '#:try-merge #f))
))
