#!/usr/bin/env python3

from logging import error, warning, basicConfig
from os import listdir

dependencies = {}
base = 'glibc/localedata/locales/'

for filename in sorted(listdir(base)):
    path = base + filename
    with open(path) as locale:
        for line in locale:
            line = line[:-1]
            if line.startswith('copy'):
                # next line also supports tab characters
                dependency = ' '.join(line.split()).split(' ')[1]
                if dependency == '':
                    error('Could not find dependency in locale {} for line {}'
                          .format(filename, line))
                    exit(1)
                if dependency[0] == '"' and dependency[-1] == '"':
                    dependency = dependency[1:-1]
                if filename not in dependencies:
                    dependencies[filename] = set()
                dependencies[filename].add(dependency)

reported = [] # prevent reporting reverse direction
for destination, sources in sorted(dependencies.items()):
    for source in sources:
        if source in dependencies and destination in dependencies[source] and (source, destination) not in reported:
            warning('Cyclic dependencies via copy found between locales {} and {}'
                    .format(destination, source))
            reported.append((destination, source))

omit =('i18n', 'iso14651_t1', 'iso14651_t1_common', 'iso14651_t1_pinyin')
with open('graph.gv', 'w') as graph:
    graph.write('''digraph G {
ratio="auto"
''')
    for destination, sources in sorted(dependencies.items()):
        for source in sources:
            if source not in omit and destination not in omit:
                if (destination, source) in reported:
                    graph.write(f'"{source}" -> "{destination}" [color="red"]\n')
                else:
                    graph.write(f'"{source}" -> "{destination}"\n')
    graph.write('''}''')

print('Now, run: twopi -Tpdf graph.gv -ograph.pdf')
print('Now, run: twopi -Tpng graph.gv -ograph.png')
