(in-package :cl-user)
(defpackage :corvus-test.types
  (:use :cl :fiveam :corvus.types)
  (:import-from :corvus.parser
                :parse-string))
(in-package :corvus-test.types)

(def-suite types)
(in-suite types)

(defun emit-parsed (string)
  (emit-type (parse-string string) (create-default-tenv)))

(test emit-atom
  (is-true (typep (emit-parsed "()") '<unit>))
  (is-true (typep (emit-parsed "bool") '<bool>)))

(test emit-tuple
  (is-true (typep (emit-parsed "(tup i8 i8 i8)") '<tuple>))
  (is-true (typep (emit-parsed "{i8 i16 i32}") '<tuple>)))

(test emit-array
  (is-true (typep (emit-parsed "(array i8)") '<array>))
  (is-true (typep (emit-parsed "[i8]") '<array>)))

(run! 'types)
