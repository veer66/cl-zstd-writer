;;;; cl-zstd-writer.asd

(asdf:defsystem #:cl-zstd-writer
  :description "Describe cl-zstd-writer here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "package")
               (:file "cl-zstd-writer")))
