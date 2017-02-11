
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then f b' else b';;
