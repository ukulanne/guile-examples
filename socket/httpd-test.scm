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