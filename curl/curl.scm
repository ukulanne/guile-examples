(use-modules (curl))
(define handle (curl-easy-init))
(curl-easy-setopt handle 'url "http://www.gnu.org")
(define s (curl-easy-perform handle))
(display s)