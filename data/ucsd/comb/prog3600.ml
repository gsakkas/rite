
let rec wwhile (f,b) =
  match b with | (e,boo) -> if boo = true then e else wwhile f e;;
