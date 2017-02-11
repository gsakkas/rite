
let rec wwhile (f,b) =
  match b with | (f',b') -> if b' then wwhile (f, f') else f';;
