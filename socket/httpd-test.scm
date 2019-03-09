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

(use-modules (ice-9 rdelim))

(let ((s (socket PF_INET SOCK_STREAM 0)))
  (connect s AF_INET (inet-pton AF_INET "9.39.70.13") 10050)
;;  (connect s AF_INET (inet-pton AF_INET "192.86.34.21") 10051)
  (display "GET / HTTP/1.0\r\n\r\n" s)
  (newline)
  (do ((line (read-line s) (read-line s)))
      ((eof-object? line))
    (display line)
    (newline)))
