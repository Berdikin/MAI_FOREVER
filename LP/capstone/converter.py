file = open( "mytree.ged", "r")
inform = file.readlines()
file.close()

person = {}
ID = ""
name = ""

for line in inform:
    if(line.find('INDI', 0, len(line)-1)!=-1):
        word = line.split(' ')
        ID = word[1]
    elif ((line.find('GIVN',0,len(line)-1)!=-1)):
        word = line.split(' ')
        name = word[2].rstrip()
    elif ((line.find('SURN', 0, len(line) - 1) != -1)):
        word = line.split(' ')
        name = name + ' ' + word[2].rstrip()
        person[ID]= name

parents = []
husb = ""
wife = ""

for line in inform:
    if(line.find('HUSB', 0, len(line)-1)!=-1):
        word = line.split(' ')
        husb = person[word[2].rstrip()]
    elif(line.find('WIFE', 0, len(line)-1)!=-1):
        word = line.split(' ')
        wife = person[word[2].rstrip()]
    elif(line.find('CHIL', 0, len(line)-1)!=-1):
        word = line.split(' ')
        parents.append([person[word[2].rstrip()], husb, wife])

outfile = open("result.pl", "w")

for i in parents:
    outfile.write("parents('" + i[0] + "','" + i[1] + "','" + i[2] + "').\n")
outfile.close()
