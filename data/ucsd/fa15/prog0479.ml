
let rec wwhile (f,b) =
  match b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;
