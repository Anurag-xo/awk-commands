# AWK Scripting – Complete

## 📌 Introduction

AWK is a powerful text processing tool in Linux, primarily used for **pattern scanning and processing**. It reads files line by line, splits each line into fields, compares them against patterns, and performs actions.

## 📝 Basic Syntax

```

awk \[options] 'pattern {action}' file\_name

```

- **Example using pipe:**
  ```bash
  echo "Hello" | awk [options] 'pattern {action}'
  ```

### ⚙️ Common Options

| Option         | Description                   |
| -------------- | ----------------------------- |
| `-F`           | Sets field separator          |
| `-v var=value` | Defines a variable            |
| `-f file`      | Reads AWK program from a file |

---

## 🔍 How AWK Works?

Given `test.txt`:

```
This is line one
This is line two
```

When AWK reads it:

- **Row 1:** This is line one
- **Row 2:** This is line two

Each row is split into **fields**:

| Field | Value |
| ----- | ----- |
| \$1   | This  |
| \$2   | is    |
| \$3   | line  |
| \$4   | one   |

---

### 📖 Key Terms

| Term       | Meaning                          |
| ---------- | -------------------------------- |
| `NR`       | Current record (line) number     |
| `NF`       | Number of fields in current line |
| `$0`       | Entire line                      |
| `$1`, `$2` | Field 1, Field 2, etc.           |

---

## 🛠️ Common Examples

✅ **Print only a specific column**

```bash
awk '{print $2}' file
```

✅ **Print last column**

```bash
awk '{print $NF}' file
```

✅ **Print specific line (e.g., line 5)**

```bash
awk 'NR==5 {print $0}' file
```

✅ **Print row number at start of each line**

```bash
awk '{print NR, $0}' file
```

✅ **Print range of lines (line 3 to 6)**

```bash
awk 'NR>=3 && NR<=6 {print $0}' file
```

✅ **Get line numbers of empty lines**

```bash
awk 'NF==0 {print NR}' file
```

✅ **Search for a word in a file**

```bash
awk '/word/ {print $0}' file
```

✅ **Search for multiple words**

```bash
awk '/word1|word2/ {print $0}' file
```

✅ **Ignore case while searching**

```bash
awk 'BEGIN{IGNORECASE=1} /word/ {print $0}' file
```

✅ **Check if a character exists in a column**

```bash
awk '$2 ~ /char/' file
```

---

## 📂 Working with CSV or Different Delimiters

✅ **Read CSV file and print a column**

```bash
awk -F, '{print $1}' file.csv
```

✅ **Print employees with salary > 50k**

```bash
awk -F, '$NF>50000 {print $0}' file.csv
```

✅ **Handling multiple delimiters**

You can use regular expressions with `-F`:

```bash
awk -F '[,:]' '{print $1}' file
```

---

## 💡 Use Cases

- **Get status of a service**

  ```bash
  systemctl status apache2 | awk '/Active/ {print $2}'
  ```

- **List files in a directory**

  ```bash
  ls -l | awk '{print $9}'
  ```

- **Read logs between timestamps (example)**

  ```bash
  awk '$0 >= "10:00" && $0 <= "12:00"' logfile
  ```

- **Get files modified in October**

  ```bash
  ls -l | awk '$6 == "Oct" {print $9}'
  ```

---

## 🔧 Useful AWK Functions

✅ **Replace a word**

```bash
awk '{gsub("old", "new"); print}' file
```

✅ **Length of line/field**

```bash
awk '{print length($0)}' file
```

✅ **Find index/position of a word**

```bash
echo "Hi Paul" | awk '{print index($0, "Paul")}'
```

✅ **Convert to upper/lowercase**

```bash
awk '{print toupper($0)}' file
awk '{print tolower($0)}' file
```

---

## 📚 AWK Programming Concepts

```
awk '
    BEGIN {start_action}
    pattern/condition {action}
    END {stop_action}
' file_name
```

✅ **Using AWK as a script**

Create `script.awk`:

```awk
#!/bin/awk -f

BEGIN {print "Start processing"}
/pattern/ {print $0}
END {print "End processing"}
```

Run with:

```bash
awk -f script.awk file_name
```

---

## 🔄 Control Structures in AWK

- **Variables**

  ```bash
  awk -v name="Anurag" 'BEGIN {print name}'
  ```

- **If-Else**

  ```bash
  awk '{if($3>50) print "Pass"; else print "Fail"}' file
  ```

- **Arrays**

  ```bash
  awk '{arr[NR]=$0} END{for(i in arr) print arr[i]}' file
  ```

- **For Loop**

  ```bash
  awk 'BEGIN {for(i=1;i<=5;i++) print i}'
  ```

- **While Loop**

  ```bash
  awk 'BEGIN {i=1; while(i<=5) {print i; i++}}'
  ```

- **Functions**

  ```bash
  awk 'function square(x) {return x*x} BEGIN {print square(4)}'
  ```

---

## ➗ Calculations with AWK

✅ **Find total/sum of salary**

```bash
awk -F, '{sum+=$NF} END {print sum}' file
```

✅ **Find average salary**

```bash
awk -F, '{sum+=$NF} END {print sum/NR}' file
```

✅ **Find no. of lines**

```bash
awk 'END {print NR}' file
```

✅ **Ignore headers (first row) while counting**

```bash
awk 'NR>1 {count++} END {print count}' file
```

---

## ✅ Conditional Examples

- **Get length of longest line**

  ```bash
  awk '{if(length>max) max=length} END{print max}' file
  ```

- **Print HIGH if salary >50k else LOW**

  ```bash
  awk -F, '{if($NF>50000) print "HIGH"; else print "LOW"}' file
  ```

- **Print total salary paid in Loan department**

  ```bash
  awk -F, '$2=="Loan" {sum+=$NF} END {print sum}' file
  ```

---

## 🔖 Summary

AWK is a versatile tool to:

- Process files line by line
- Filter based on patterns
- Perform calculations and transformations
- Automate log analysis and data extraction
