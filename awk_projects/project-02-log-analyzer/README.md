# Project 02: Log Analyzer

This project uses AWK to analyze a log file.

## Usage

```bash
awk -f analyzer.awk log_file.log
```

## Log Format

The log file is expected to have the following format:

```
<IP_ADDRESS> - - [<TIMESTAMP>] "<REQUEST>" <STATUS_CODE> <SIZE>
```

## Analyzer

The `analyzer.awk` script does the following:

*   Counts the number of requests from each IP address.
*   Counts the number of occurrences of each status code.
*   Calculates the total size of all requests.
