
let rec wwhile (f,b) =
  let (b',c') = b in match c' with | true  -> wwhile (f, b') | false  -> b';;
