(defun square(x) (* x x))

(defclass cart ()                ; имя класса и надклассы
 ((x :initarg :x :reader cart-x)   ; дескриптор слота x
  (y :initarg :y :reader cart-y))) 

(defclass polar ()
 ((radius :initarg :radius :accessor radius) 	; длина >=0
  (angle  :initarg :angle  :accessor angle)))

(defmethod radius ((c cart))
  (sqrt (+ (square (cart-x c))
           (square (cart-y c)))))

(defmethod angle ((c cart))
  (atan (cart-y c) (cart-x c)))	

(defgeneric to-polar (arg)
 (:documentation "Преобразование аргумента в полярную систему.")
 (:method ((p polar))
  p)
 (:method ((c cart))
  (make-instance 'polar
                 :radius (radius c)
                 :angle (angle c))) )

(defmethod cart-x ((p polar))
  (* (radius p) (cos (angle p))))

(defmethod cart-y ((p polar))
  (* (radius p) (sin (angle p))))

(defgeneric to-cart (arg)
 (:documentation "Преобразование аргумента в декартову систему.")
 (:method ((c cart))
  c)
 (:method ((p polar))
  (make-instance 'cart
                 :x (cart-x p)
                 :y (cart-y p))) )

(defmethod sub2 ((c1 cart) (c2 cart))
  (make-instance 'cart
                 :x (- (cart-x c1) (cart-x c2))
                 :y (- (cart-y c1) (cart-y c2))))

(defmethod sub2 ((p1 polar) (p2 polar))
  (to-polar (sub2 (to-cart p1)
                  (to-cart p2))))

(defmethod sub2 ((c cart) (p polar))
  (sub2 c (to-cart p)))

(defmethod add2 ((c1 cart) (c2 cart))
  (make-instance 'cart
                 :x (+ (cart-x c1) (cart-x c2))
                 :y (+ (cart-y c1) (cart-y c2))))

(defmethod add2 ((p1 polar) (p2 polar))
  (to-polar (add2 (to-cart p1)
                  (to-cart p2))))

(defmethod add2 ((c cart) (p polar))
  (add2 c (to-cart p)))

(defgeneric mul2 (arg1 arg2)
 (:method ((n1 number) (n2 number))
  (* n1 n2)))

(defmethod print-object ((c cart) stream)
  (format stream "[CART x ~d y ~d]"
          (cart-x c) (cart-y c)))

(defmethod print-object ((p polar) stream)
  (format stream "[POLAR radius ~d angle ~d]"
          (radius p) (angle p)))

(defgeneric fourth-vertex-cart(v1 v2 v3) (:documentation "Строит параллелограм по 3-м точкам"))

(defmethod fourth-vertex-cart((c1 cart) (c2 cart) (c3 cart))
    (add2 (sub2 c2 c1) c3))
 

(defmethod fourth-vertex-cart((p1 polar) (p2 polar) (p3 polar))
    (fourth-vertex-cart (to-cart p1) (to-cart p2) (to-cart p3)))


(print (fourth-vertex-cart (make-instance 'cart :x 1 :y 1) (make-instance 'cart :x 1 :y 4) (make-instance 'cart :x 2 :y 3)))