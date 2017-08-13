"""
Also supports:

    octal => 010 (takes 0-7)
    binary => 0b10 (takes 0-1)
    hex => hex (no change)


"""

import sys

for i in sys.argv:
    try:
        print(hex(int(i, 0)))
    except:
        pass

