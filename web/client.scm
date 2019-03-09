(use-modules (web uri)
	     (web client))


(define (http-get->str url port path)
  (let ((uri (build-uri 'http #:host url #:port port #:path path)))
    (call-with-values
	(lambda () (http-get uri  #:keep-alive? #f))
      (lambda (request body) body))))
  
(display (http-get->str "www.foo.com" 8080 "/api/status"))

(newline)
