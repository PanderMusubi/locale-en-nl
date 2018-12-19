#!/usr/bin/env python3

from logging import error, warning, info, INFO, basicConfig
from os import listdir

dependencies = {}
base = 'glibc/localedata/locales/'
#basicConfig(level=INFO)

for filename in sorted(listdir(base)):
    path = base + filename
    info('Processing locale file {}...'.format(path))
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