# cl-zstd-writer
### _Vee Satayamas <5ssgdxltv@relay.firefox.com>_

A Zstd writer wrapper for Common Lisp

## Example

```Lisp
(defvar *w1* nil)
(setf *w1* (open-writer "/tmp/kaka1" 3))
(defvar *buf* nil)
(setf *buf* (make-static-vector 3 :element-type '(unsigned-byte 8) :initial-contents '(1 2 3)))
(write-to-archive *w1* *buf*)
(close-writer *w1*)

```

## License

GPL-3.0

