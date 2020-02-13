#!/usr/bin/env python
#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import sys
from xml.dom.minidom import parseString

def main(argv):
    reload(sys)
    sys.setdefaultencoding('utf8')
    original_file = 'vendor/lotus/prebuilt/common/etc/apns-conf.xml'

    if len(argv) == 3:
        output_file_path = argv[1]
        lotus_override_file = argv[2]
    else:
        raise ValueError("Wrong number of arguments %s" % len(argv))

    lotus_apn_names = []
    with open(lotus_override_file, 'r') as f:
        for line in f:
            xmltree = parseString(line)
            carrier = xmltree.getElementsByTagName('apn')[0].getAttribute('carrier')
            lotus_apn_names.append(carrier)

    with open(original_file, 'r') as input_file:
        with open(output_file_path, 'w') as output_file:
            for line in input_file:
                writeOriginalLine = True
                for apn in lotus_apn_names:
                    if apn in line:
                        with open(lotus_override_file, 'r') as lotus_file:
                            for override_line in lotus_file:
                                if apn in override_line:
                                    output_file.write(override_line)
                                    writeOriginalLine = False
                                    lotus_apn_names.remove(apn)
                if writeOriginalLine:
                    if "</apns>" in line:
                        if lotus_apn_names:
                            for apn in lotus_apn_names:
                                with open(lotus_override_file, 'r') as lotus_file:
                                    for override_line in lotus_file:
                                        if apn in override_line:
                                            output_file.write(override_line)
                    output_file.write(line)

if __name__ == '__main__':
    main(sys.argv)
