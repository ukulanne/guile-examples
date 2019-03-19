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

(use-modules (srfi srfi-19) (web server) (web request)
	     (web response) (web uri))
  
(define SERVER-VERSION "Server Version 0.27")
(define GUILE-VERSION "\nguile (GNU Guile) 2.0.11")
(define VERSION (string-append SERVER-VERSION GUILE-VERSION))
(define SERVER-PORT 8081)
(define PRINT-LOG-FLAG #t) 
  
  ;; uri helper functions
(define (params->hash str)
  (if (not str)
      (make-hash-table 0)
      (let* ((params (map (lambda (s) (string-split s #\=))(string-split str #\&)))
	     (hash (make-hash-table (length params))))
	(for-each (lambda (h) (hashq-set! hash  (string->symbol  (car h)) (cadr h))) params)
	hash)))
(define (get-hash request) (params->hashget (uri-query (request-uri request))))
(define (print str) (values '((content-type . (text/plain))) str))
(define (request? request str) (equal? (request-path-components request) (list str)))
(define (request-path-components request) (split-and-decode-uri-path (uri-path (request-uri request))))
   
 (define (handler request body) 
  (let ((hash (get-hash request)))
    (cond 
     ((request? request "version")        (print VERSION))
     (else (not-found request)))))

(define (not-found request)
  (values (build-response #:code 404) (string-append "Server 404 Error.\n Resource not found.\n Last update: " 
						     (date->string (current-date) "~c"))))
;; run server

(run-server handler 'http `(#:port ,SERVER-PORT))
