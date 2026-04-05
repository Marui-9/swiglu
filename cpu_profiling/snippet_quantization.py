from gguf import GGUFReader
r = GGUFReader(r"C:\Users\Jacob\Desktop\LFM2.5-1.2B-Thinking-Q4_K_M.gguf")
for t in r.tensors:
    if any(k in t.name for k in ["ffn", "feed_forward", "gate", "up", "down"]):
        print(f"{t.name:<60} {t.tensor_type.name}")
