(define (signal-handler signum)
  (if (= signum SIGINT)
      (display "SIGINT catched\n")))

(define (main)
  (sigaction SIGINT signal-handler)
  (sleep 1)
  (main))

(main)
