from gguf import GGUFReader
r = GGUFReader(r"C:\Users\Jacob\Desktop\LFM2.5-1.2B-Thinking-Q4_K_M.gguf")
for k in r.fields:
    print(k, r.fields[k].parts[-1])
