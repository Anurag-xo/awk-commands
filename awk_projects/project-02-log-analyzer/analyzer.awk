#!/bin/awk -f

{
    # Count IP addresses
    ips[$1]++

    # Count status codes
    status_codes[$9]++

    # Sum total size
    total_size += $10
}

END {
    print "IP Address Counts:"
    for (ip in ips) {
        print "  " ip ": " ips[ip]
    }

    print "\nStatus Code Counts:"
    for (code in status_codes) {
        print "  " code ": " status_codes[code]
    }

    print "\nTotal Size of All Requests:"
    print "  " total_size " bytes"
}
