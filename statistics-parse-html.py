
myCompany = "cpb"
myDesc = "statistics"

def wanted_html(myString):
    if not myString: return
    elif myString == ' ': return
    if len(myString) > 1:
        if myString[1:6] == 'table': return myString[0:6] + '>'
        if myString[1:7] == '/table': return myString[0:7] + '>'
        if myString[0:2] == '<!': return
        if myString[0:2] == '<h': return
        if myString[0:2] == '<i': return
        if myString[0:2] == '<d': return
        if myString[0:2] == '<s': return
        if myString[1] == r'/': return
        if myString[0:2] == 'if': return
        if myString[1:3] == 'td': return myString[0:3] + '>'
        if myString[1:3] == 'tr': return myString[0:3] + '>'
        if myString[1:3] == 'th': return myString[0:3] + '>'
        if myString[0:4] == '<fin' : return
        if myString[0:2] == '<a': return
        if myString[0:2] == '<l': return
        if myString[0:2] == '<u': return
        if myString[0:2] == '<b': return
        if myString[0:2] == '<p': return
#        if myString[0:15] == 'Company Outlook': return
 #       if myString[0:5] == 'Chart': return
  #      if myString[0:13] == 'Conversations': return
   #     if myString[0:10] == 'Statistics': return
    #    if myString[0:7] == 'Profile' : return
     #   if myString[0:8] == 'Analysis' : return
      #  if myString[0:7] == 'Options' : return
       # if myString[0:7] == 'Holders' : return
#        if myString[0:7] == 'Summary' : return
 #       if myString[0:10] == 'Historical' : return
  #      if myString[0:10] == 'Financials' : return
   #     if myString[0:14] == 'Sustainability' : return
    #    if myString[0:8] == 'Currency' : return
        if myString[-1] == ')' : myString = myString[:-1]
        if myString[0] == ' ' :
            myString = myString[1:]
            if myString[0] == '(': myString = myString[1:]
    return myString

symList = open ( "symbol-list.txt" )
symArray = symList.readlines()
#symArray = ['cpb\n']

for myCompany in symArray:
    myCompany = myCompany.lower()[:-1]
    print(myCompany)
    
    input = open ( r"text-files/mar-2022/line19" + "-" + myCompany + "-" + myDesc + ".txt", "r")
    output = open ( r"parsed-files/mar-2022/line19" + "-" + myCompany + "-" + myDesc + ".txt", "w")
    myBlock = ''

    line = ''
    try:
        line = input.read()

    except UnicodeDecodeError:

        input.seek(0,0)
        line = ''
        char = None
        while 1:
            try:
                char = input.read(1)
            except UnicodeDecodeError:
                char = ' '
        
            if not char: break
            line = line + char

    info = ''
    table_block = 'n'
    status = 'c'  # beginning  t is for tag c is for content
    for ch in (line):

        if (status == 'c') and (ch != '<'):   #content block
            info += ch
            continue
        elif (status == 'c') and (ch == '<'):
            result = wanted_html(info)
    #        if result:
            if result and (table_block == 'y'):

                myBlock += result + "\n"
        
            status = 't'
            info = ch
            continue

        if (status =='t') and (ch != '>'):     #tag block
            info += ch
            continue
        elif ( status =='t') and (ch == '>'):
            info += ch
            result = wanted_html(info)
            if result:
                if result == '<table>': table_block = 'y'
                if result == '</table>': table_block = 'n'
                if table_block == 'y':
                    myBlock += result + "\n"
        
            info = ''
            status = 'c'


    output.write(myBlock)




