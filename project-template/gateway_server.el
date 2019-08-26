;; Customize some variables
(setq gateway-server-root "~/anhongyu1/workspace/gateway_server")
(setq gateway-server-src-dirs
      '("bid_request_server"
        "build64_release/gw_base/proto"
        "common"
        "render"
        "traffic/broker"
        "utils"))

(cd gateway-server-root)
(shell-command (format "/bin/rm -f %s/TAGS && touch %s/TAGS" gateway-server-root gateway-server-root))

;; generate TAGS
(while gateway-server-src-dirs
  (generate-cpp-tags-under-dir-append (concat gateway-server-root "/" (car gateway-server-src-dirs)))
  (setq gateway-server-src-dirs (cdr gateway-server-src-dirs)))

;; load TAGS
(visit-tags-table (concat gateway-server-root "/" "TAGS"))

(setq compile-command (format "cd %s && blade build :bidserver -j4" gateway-server-root))

(message "Initial Job for gateway_server project, Done.")
