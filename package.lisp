;;;; package.lisp

(defpackage #:cl-zstd-writer
  (:use #:cl #:cffi #:static-vectors)
  (:export #:open-writer
	   #:write-to-archive
	   #:close-writer))
