;funcion basada en https://stackoverflow.com/questions/387775/using-and-with-the-apply-function-in-scheme
(define and-l (lambda (x) 
    (if (null? x)
        #t
        (and (car x) (and-l (cdr x)) ))))

;funcion identidad f(x)=x
(define id
	(lambda (x) x) 
)

;f(x)=-x
(define neg
	(lambda (x) (* x -1))
)

;f(x)=x*x
(define cuadrado
	(lambda (x) (* x x))
)

;f(x)=x*x*x
(define cubo
	(lambda (x) (* x x x))
)
;evaluar-puntos
(define evaluar-puntos
  (lambda (funcion x)
    (if (null? x)
      (list)
    
    (cons(cons (car x) (funcion (car x )))(evaluar-puntos funcion (cdr x)))
    )
  
  )
)
;es-creciente-en-punto?
(define es-creciente-en-punto?
  (lambda (funcion x)
    (and (if (<= (funcion (+ x 1)) (funcion x)) #f #t) 
         (if (<= (funcion x) (funcion (- x 1))) #f #t)
          
  )
)
)
;es-decreciente-en-punto?
(define es-decreciente-en-punto?
  (lambda (funcion x)
    (and (if (>= (funcion (- x 1)) (funcion x)) #t #f) 
         (if (>= (funcion x) (funcion (+ x 1))) #t #f)
          
  )
)
)
;es-creciente-en-muestra?
(define es-creciente-en-muestra?
    (lambda (funcion lista)
    (if (null? lista)#t
     (if (equal? (es-creciente-en-punto? funcion (car lista)) #t)
       (es-creciente-en-muestra? funcion (cdr lista)) #f)
    )
    )
)
;es-decreciente-en-muestra?
(define es-decreciente-en-muestra?
    (lambda (funcion lista)
    (if (null? lista)#t
     (if (equal? (es-decreciente-en-punto? funcion (car lista)) #t)
       (es-decreciente-en-muestra? funcion (cdr lista)) #f)
    )
    )
)
;es-monotona?
(define es-monotona?
   (lambda (funcion lista)
      (or (if (equal? (es-creciente-en-muestra? funcion lista) #t)
               (es-creciente-en-muestra? funcion lista) #f)
           (if (equal? (es-decreciente-en-muestra? funcion lista) #t)
               (es-decreciente-en-muestra? funcion lista) #f)

      )
    )
)
     

