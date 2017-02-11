
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else f b';;
