;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	dnsproject.prepa.com. root.dnsproject.prepa.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	dnsproject.prepa.com.
@	IN	A	192.168.65.17
@	IN	AAAA	::1
