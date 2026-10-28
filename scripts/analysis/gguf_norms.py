# Usage: python3 gguf_norms.py model.gguf [name-filter]
# Minimal GGUF v3 reader: print stats of the F32 tensors (norm weights) without numpy.
import struct, sys, math
f = open(sys.argv[1], 'rb')
def rd(fmt): return struct.unpack('<' + fmt, f.read(struct.calcsize('<' + fmt)))
def rstr(): (n,) = rd('Q'); return f.read(n).decode('utf-8', 'replace')
SZ = {0:'B',1:'b',2:'H',3:'h',4:'I',5:'i',6:'f',7:'?',10:'Q',11:'q',12:'d'}
def rval(t):
    if t == 8: return rstr()
    if t == 9:
        (et, n) = rd('IQ')
        return [rval(et) for _ in range(n)] if et == 8 or et == 9 else f.read(n * struct.calcsize(SZ[et])) and None
    return rd(SZ[t])[0]
magic, ver, nt, nkv = rd('4sIQQ')
align = 32
for _ in range(nkv):
    k = rstr(); (t,) = rd('I'); v = rval(t)
    if k == 'general.alignment': align = v
tens = []
for _ in range(nt):
    name = rstr(); (nd,) = rd('I'); dims = rd('Q' * nd); (ty, off) = rd('IQ')
    tens.append((name, dims, ty, off))
base = (f.tell() + align - 1) // align * align
for name, dims, ty, off in tens:
    if ty != 0: continue
    n = 1
    for d in dims: n *= d
    f.seek(base + off); v = struct.unpack('<%df' % n, f.read(4 * n))
    if len(sys.argv) > 2 and sys.argv[2] not in name: continue
    m = sum(v) / n
    print(f"{name:28s} n={n:5d} mean={m:+.4f} min={min(v):+.4f} max={max(v):+.4f} nan={sum(1 for x in v if x != x)} first={v[0]:+.4f}")
