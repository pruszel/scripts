#!/usr/bin/env python3
#
# Process Kindle highlights file into
# multiple separate files, one for each book
#
# Format of source file should be as follows:
#   ===========
#   {Book Title}
#   - Your Highlight on Location...
#
#   {Highlight text}
#   ===========
#   ...
#
import sys

# Check file name is given as input argument
if len(sys.argv) < 1:
    print("Error! Must give file name as argument")
    exit(1)

# Open file
try:
    file = open(sys.argv[1], mode='r', encoding='utf-8-sig')
except:
    print("Unable to open file", sys.argv[1])
    exit(1)

# Store highlights in dict of arrays by book title
bookTitle = ""
highlights = {
    # 'bookTitle': [
    #   "Highlight 1", "Highlight 2", etc.
    # ]
}

# Loop through all lines in file
for line in file:
    line = line.strip()

    # Skip blank lines
    if len(line) == 0:
        continue

    # Title is on next line
    if line[0] == "=":
        bookTitle = file.readline()
        bookTitle = bookTitle.replace("\ufeff", "").replace("\n", "")
        bookTitle = bookTitle[0: bookTitle.find("(") - 1]

    # Junk line with location and date
    elif line[0] == "-":
        pass
    else:
        if bookTitle in highlights:
            highlights[bookTitle].append(line)
        else:
            highlights[bookTitle] = [line]
file.close()

# Create file for each book's highlights
for bookTitle in highlights:
    try:
        file = open(bookTitle+".txt", 'w')
    except:
        print("Error! Unable to create files")
        exit(1)

    for line in highlights[bookTitle]:
        file.write(line+"\n\n")

    file.close()
    print("Created file for", bookTitle, "highlights")

print("\nDone!")
