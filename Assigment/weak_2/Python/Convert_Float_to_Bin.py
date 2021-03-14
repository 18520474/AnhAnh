import struct
f = open("compare.txt", "r")
convert = open("compare_bin.txt", "w")
def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')
case = f.readline()
while case != '':

    out_num = float_to_bin(float(case))
    convert.write(out_num + '\n')
    case = f.readline()
    #print(out_num)
