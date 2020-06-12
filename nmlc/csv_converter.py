# print statements aren't necessary, but they help see what the script is doing when it runs
# print is helpful for 'wtf?' moments
print("Running script...")

 # this module is a good way to handle working with files that might contain unicode (e.g. translations) 
import codecs

# import the template module
from string import Template

sections = [] # create an empty list, we'll put strings in here then join them later

# get the header file and append to a list
header = codecs.open("src/header.nml",'r','utf8')
sections.append(header.read())
header.close()

# get a template to use for townname

townname_template = Template(codecs.open('src\town_template.tnml','r','utf8').read())

import CSV
with open('src\massachusetts.csv', 'rb') as f:
    reader = csv.reader(f)
for row in reader:
    print("Templating: " + i)
    sections.append(townname_template.substitute(name=i))

  
print("Writing the file...")

# create a new file on disk, which will have a name and be writable
processed_nml_file = codecs.open('src\massachusetts.nml','w','utf8')

# write stuff into the file
processed_nml_file.write('\n'.join(sections)) # join the list of templated stuff with newlines, and write to a file
processed_nml_file.close() # we're done with this file now, finish with it