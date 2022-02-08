;;;; cl-zstd-writer.asd

(asdf:defsystem #:cl-zstd-writer
  :description "Describe cl-zstd-writer here"
  :author "Vee Satayamas <your.name@example.com>"
  :license  "Specify license here"
  :version "0.2.0"
  :serial t
  :depends-on (#:cffi #:static-vectors)
  :components ((:file "package")
               (:file "cl-zstd-writer")))
