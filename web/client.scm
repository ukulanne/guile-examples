#!/usr/bin/env guile -s
!#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anne Summers                  ;;
;; <ukulanne@gmail.com>          ;;
;; March 8, 2019                 ;;
;; Guile web app server example  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    This program is free software: you can redistribute it and/or modify  ;;
;;    it under the terms of the GNU General Public License as published by  ;;
;;    the Free Software Foundation, either version 3 of the License, or     ;;
;;    (at your option) any later version.                                   ;;
;;                                                                          ;;
;;    This program is distributed in the hope that it will be useful,       ;;
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of        ;;
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         ;;
;;    GNU General Public License for more details.                          ;;
;;                                                                          ;;
;;    You should have received a copy of the GNU General Public License     ;;
;;    along with this program.  If not, see <https://www.gnu.org/licenses/>.;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Time-stamp: <2019-03-08 14:55:40 panda> 

(use-modules (web uri)
	     (web client))


(define (http-get->str url port path)
  (let ((uri (build-uri 'http #:host url #:port port #:path path)))
    (call-with-values
	(lambda () (http-get uri  #:keep-alive? #f))
      (lambda (request body) body))))
  
(display (http-get->str "www.foo.com" 8080 "/api/status"))

(newline)
