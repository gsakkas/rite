
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, (failwith "asd")) else failwith "asd"), b);;
