# problem reading ... <span class="Va(m)">Other Income Expense</span>


myCompany = "ibm"
myDesc = "financials"

def wanted_html(myString):
    if not myString: return
    elif myString == ' ': return

    if myString == ':' : return
    if len(myString) > 1:
#        if myString[1:6] == 'table': return myString[0:6] + '>'
 #       if myString[1:7] == '/table': return myString[0:7] + '>'
        if myString[0:2] == '<!': return
        if myString[0:2] == '<h': return
        if myString[0:2] == '<i': return
        if myString[0:2] == '<d': return
        if myString[0:4] == '<svg': return myString[0:4] + '>'
        if myString[0:5] == '<span': return myString[0:5] + '>'
        if myString[0:7] == '<script': return
        if myString[0:8] == '<section': return
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
        if myString[0:5] == 'Show' : return
        if myString[0:10] == 'Breakdown' : return
        if myString[0:10] == 'Learn More': return
        if myString[0:10] == 'Get access': return
        if myString[0:12] == 'All numbers': return
        if myString[0:11] == 'Expand All': return
        if myString[0:9] ==  'Download': return
        if myString[0:9] == 'Subscribe': return
        if myString[0:13] == 'Yahoo Finance': return
        if myString[0:11] == 'Learn more' : return

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
   #     if myString[-1] == ')' : myString = myString[:-1]
    #    if myString[0] == ' ' :
     #       myString = myString[1:]
      #      if myString[0] == '(': myString = myString[1:]
    return myString

symList = open ( "symbol-list.txt" )
symArray = symList.readlines()

for myCompany in symArray:
    myCompany = myCompany.lower()[:-1]
    print(myCompany)
    

    input = open ( r"text-files/mar-2022/line21" + "-" + myCompany + "-" + myDesc + ".txt", "r")
    output = open ( r"parsed-files/mar-2022/line21" + "-" + myCompany + "-" + myDesc + ".txt", "w")
    myBlock = ''

    info = ''
    line = input.read()
    table_block = 'n'
    status = 'c'  # beginning  t is for tag c is for content
    for ch in (line):

        if (status == 'c') and (ch != '<'):   #content block
            info += ch
            continue
        elif (status == 'c') and (ch == '<'):
            result = wanted_html(info)
            if result:
    #        if result and (table_block == 'y'):

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
      #          if result == '<table>': table_block = 'y'
       #         if result == '</table>': table_block = 'n'
        #        if table_block == 'y':
                myBlock += result + "\n"
        
            info = ''
            status = 'c'


    output.write(myBlock)




