;;;; cl-zstd-writer.lisp

(in-package #:cl-zstd-writer)

(define-foreign-library zstd_writer
  (:win32 #.(namestring
	   (asdf:system-relative-pathname :cl-zstd-writer
					  "zstd_writer/target/release/zstd_writer.dll")))
  (:unix #.(namestring
	  (asdf:system-relative-pathname :cl-zstd-writer
					 "zstd_writer/target/release/libzstd_writer.so")))
  (t (:default "zstd_writer")))

(use-foreign-library zstd_writer)

(defcfun ("zstd_writer_open" open-writer*) :pointer (zstd_archive_path :string) (level :int32))
(defcfun ("zstd_writer_write" write-to-archive*) :int32 (writer :pointer) (buf :pointer) (len :unsigned-int))
(defcfun ("zstd_writer_close" close-writer*) :int32 (writer :pointer))
 
(define-condition unable-to-open-archive (error)
  ((archive-path :initarg archive-path
		 :reader archive-path)))
(define-condition unable-to-finish-archiving (error)
  ((writer :initarg writer
	   :reader writer)))
(define-condition unable-to-write-to-archive (error)
  ((writer :initarg writer
	   :reader writer)
   (buffer :initarg buffer
	   :reader buffer)))

(defun open-writer (zstd-archive-path level)
  (let ((writer (open-writer* zstd-archive-path level)))
    (if (null-pointer-p writer)
	(error 'unable-to-open-archive :archive-path zstd-archive-zpath)
	writer)))

(defun write-to-archive (writer buf)
  (when (/= (write-to-archive* writer (static-vector-pointer buf) (length buf)) 0)
    (error 'unable-to-write-to-archive
	   :writer writer
	   :buffer buffer)))

(defun close-writer (writer)
  (when (/= (close-writer* writer) 0)
    (error 'unable-to-finish-archiving :writer writer)))
